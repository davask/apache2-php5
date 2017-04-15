dwlDir="/dwl";

. ${dwlDir}/envvar.sh
. ${dwlDir}/user.sh
. ${dwlDir}/ssh.sh

echo ">> Ubuntu initialized";

echo ">> Base initialized";

. ${dwlDir}/permission.sh
echo ">> permission assigned";

. ${dwlDir}/activateconf.sh
echo ">> dwl conf activated";

. ${dwlDir}/apache2.sh
echo ">> apache2 initialized";

. ${dwlDir}/sendmail.sh
echo ">> sendmail initialized";

. ${dwlDir}/keeprunning.sh
