package au.edu.uts.isd.iotbay;

import au.edu.uts.isd.iotbay.controllers.RegisterController;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/")
public class App extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<>();

        classes.add(RegisterController.class);

        return classes;
    }
}
