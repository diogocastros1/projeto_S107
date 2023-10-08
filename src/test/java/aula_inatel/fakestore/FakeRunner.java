package aula_inatel.fakestore;

import com.intuit.karate.junit5.Karate;

public class FakeRunner {
    @Karate.Test
    Karate Fake_Runner() {
        return Karate.run("fakestore").relativeTo(getClass());
    }    

}
