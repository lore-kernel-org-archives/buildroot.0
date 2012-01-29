From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 10:49:59 +0100
Subject: [Buildroot] [git commit] libevas: Config.in: add upstream URL
Message-ID: <20120129222324.A97A490042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf7d98d8410955b192f99dc412503c89fa14a57e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 637d895..6ec05d5 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LIBEVAS
 	  super and sub-sampled scaled images, alpha-blend objects
 	  much and more.
 
+	  http://trac.enlightenment.org/e/wiki/Evas
+
 if BR2_PACKAGE_LIBEVAS
 
 comment "libevas rendering options"
