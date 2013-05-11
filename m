From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:42:15 +0200
Subject: [Buildroot] [git commit branch/next] python3: remove another config
	script
Message-ID: <20130511204540.993389A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd8f39653a9939a5d5e1043c874e4b26f412c388
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python3/python3.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7551a7b..239ac8f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -130,6 +130,7 @@ PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_FIXUP_LIBDIR
 #
 define PYTHON3_REMOVE_DEVFILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
+	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 endef
 
