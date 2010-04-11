From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:11 +0200
Subject: [Buildroot] [PATCH 15/25] Bring the three path-related options
	together
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <15d8c4d64617bf02624029fa7eac4f97071b3941.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 1b717b3..de0c3b2 100644
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
