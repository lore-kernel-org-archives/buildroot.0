From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Bring the three path-related
	options together
Message-ID: <20100411195036.0CFDA20B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa41d377e30fb7750caccb11cdb6109d57146176
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 9a33b89..1d08de7 100644
--- a/Config.in
+++ b/Config.in
@@ -88,8 +88,6 @@ config BR2_COPYTO
 	  Setting this variable will (eventually) override 
 	  any other copyto configurations in buildroot.
 
-source	"target/device/Config.in.mirrors"
-
 config BR2_STAGING_DIR
 	string "Toolchain and header file location?"
 	default "$(BASE_DIR)/staging"
@@ -103,6 +101,8 @@ config BR2_STAGING_DIR
 	  Most people will leave this set to the default value of
 	  "$(BASE_DIR)/staging".
 
+source	"target/device/Config.in.mirrors"
+
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
 	default "pc-linux-gnu"
-- 
1.6.3.3
