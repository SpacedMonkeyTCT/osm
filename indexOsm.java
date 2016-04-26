import java.io.IOException;

import org.apache.lucene.*;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;

public class indexOsm
{
	public static void main(String[] args) {
		Analyzer analyzer = new StandardAnalyzer();
		Directory directory = new RAMDirectory();
    	// To store an index on disk, use this instead:
		// Directory directory = FSDirectory.open("/tmp/testindex");

		try {
			IndexWriterConfig config = new IndexWriterConfig(analyzer);
			IndexWriter iwriter = new IndexWriter(directory, config);
			Document doc = new Document();
			String text = "This is the text to be indexed.";
			doc.add(new Field("fieldname", text, TextField.TYPE_STORED));
			iwriter.addDocument(doc);
			iwriter.close();

			// Now search the index:
			DirectoryReader ireader = DirectoryReader.open(directory);
			IndexSearcher isearcher = new IndexSearcher(ireader);

			// Parse a simple query that searches for "text":
			QueryParser parser = new QueryParser("fieldname", analyzer);
			Query query = parser.parse("text");
			ScoreDoc[] hits = isearcher.search(query, 1000).scoreDocs;

			// Iterate through the results:
			for (int i = 0; i < hits.length; i++) {
				Document hitDoc = isearcher.doc(hits[i].doc);
				System.out.println("Fieldname: " + hitDoc.get("fieldname"));
			}
			ireader.close();
			directory.close();
		}
		catch (IOException e) {
			System.err.println("Caught IOException: " + e.getMessage());
		}
		catch (ParseException e) {
			System.err.println("Caught ParseException: " + e.getMessage());
		}
	}
}
