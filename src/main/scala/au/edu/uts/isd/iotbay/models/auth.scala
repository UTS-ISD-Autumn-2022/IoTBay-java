package au.edu.uts.isd.iotbay.models:

    import scala.beans.BeanProperty
    import java.util.UUID

    object Role:
        @BeanProperty
        var Id: UUID = _

        @BeanProperty
        var Name: String = _

    object User:
        @BeanProperty
        var Id: UUID = _

        @BeanProperty
        var Username: String = _

        @BeanProperty
        var PasswordHash: String = _

        @BeanProperty
        var Role: Role = _


