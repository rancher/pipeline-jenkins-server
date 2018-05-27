import jenkins.model.*
import hudson.security.*
//import java.util.logging.Level
//import java.util.logging.Logger

//Logger.getLogger("").setLevel(Level.FINEST)

def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
def env = System.getenv()
def user = env['ADMIN_USER']
def passowrd = env['ADMIN_PASSWORD']
hudsonRealm.createAccount(user,passowrd)
instance.setSecurityRealm(hudsonRealm)
def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)
instance.save()

def mb = new Integer(1024*1024).toString()
System.setProperty("com.cloudbees.workflow.rest.external.FlowNodeLogExt.maxReturnChars",mb)
