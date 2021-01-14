package restfullbooker.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.awt.*;
import java.io.File;
import java.util.List;
import java.util.ArrayList;
import java.util.Collection;

public class TestRunner {

    @Test
    public void TestRunner() {
        System.setProperty("karate.env", "demo");//Se setea el ambiente donde queremos ejecutar
        Results results = Runner.path("classpath:restfullbooker").tags("~@ignore").parallel(1);
        generateReport(results.getReportDir());
    }
    public void generateReport(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath),new String[] {"json"},true);
        List<String> jsonPaths =new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"),"RestFullBooker Report");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths,config);
        reportBuilder.generateReports();
    }

}
