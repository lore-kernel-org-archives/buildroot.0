From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:33:20 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/python-pypcap:
 update the upstream URL in Config.in
Message-ID: <20191225212549.394CF8E451@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3988ff551a846090e55557492fc412f9357011a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2d09a16f0da90adc8577fff1c727a029916c778)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pypcap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pypcap/Config.in b/package/python-pypcap/Config.in
index 9b71575c0b..9b410ecc2b 100644
--- a/package/python-pypcap/Config.in
+++ b/package/python-pypcap/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_PYPCAP
 	  The pypcap module is an object-oriented wrapper of the C
 	  libpcap library.
 
-	  https://code.google.com/p/pypcap/
+	  https://github.com/dugsong/pypcap
