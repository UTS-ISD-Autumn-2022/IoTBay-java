package au.edu.uts.isd.iotbay.models:

    import scala.beans.BeanProperty
    import java.util.UUID

    import com.github.t3hnar.bcrypt._

    case class Role(Id: UUID, Name: String)

    case class UserCredential(
                               Id: UUID,
                               Username: String,
                               PasswordHash: String,
                               Role: Role,
                               firstName: String,
                               lastName: String)


