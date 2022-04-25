package au.edu.uts.isd.iotbay.controllers:

    import javax.mvc.{Controller, View}
    import javax.ws.rs.{GET, Path, PathParam}

    @Path("register")
    @Controller
    class RegisterController ():
        @GET
        @View("register.jsp")
        def getIndex (): Unit = ()
