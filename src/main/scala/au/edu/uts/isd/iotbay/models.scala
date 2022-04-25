package au.edu.uts.isd.iotbay.models:

    import scala.beans.BeanProperty
    import java.util.UUID

    class Role(
        @BeanProperty
        val Id: UUID
    ):
        @BeanProperty
        var Name: String = _

    class User:
        @BeanProperty
        var Id: UUID = _

        @BeanProperty
        var Username: String = _

        @BeanProperty
        var PasswordHash: String = _

        @BeanProperty
        var Role: Role = _

