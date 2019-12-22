From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:06:54 +0100
Subject: [Buildroot] [git commit] package/python-coherence: update the
 upstream URL in Config.in
Message-ID: <20191222215908.6D1298DA8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=587006496c97e512438e3cab699a88d957527c2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-coherence/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-coherence/Config.in b/package/python-coherence/Config.in
index 71f79f42ee..63427964a7 100644
--- a/package/python-coherence/Config.in
+++ b/package/python-coherence/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_COHERENCE
 	help
 	  A DLNA/UPnP Media Server and Framework for the Digital Living.
 
-	  http://coherence-project.org/
+	  https://github.com/coherence-project/Coherence
 
 comment "python-coherence needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON
