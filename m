From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 13:16:10 +0200
Subject: [Buildroot] [git commit] cjson: Add license info
Message-ID: <20120804112012.C8B609701F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6495c25cb0e8174a8a83483aff98e38943c98479
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index a9b0bcf..6f26bb8 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -7,6 +7,7 @@ CJSON_VERSION         = undefined
 CJSON_SOURCE          = cJSONFiles.zip
 CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
 CJSON_INSTALL_STAGING = YES
+CJSON_LICENSE         = MIT
 
 define CJSON_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)
