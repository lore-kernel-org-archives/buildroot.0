From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 May 2010 09:13:14 +0200
Subject: [Buildroot] [git commit master] shared-mime-info: missing
	dependency on host-intltool
Message-ID: <20100511071423.7A1FEAA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba9a902bf862a60a91f2a9d3afbd1fe5470fcb53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shared-mime-info/shared-mime-info.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index fe14142..487d4b2 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -16,7 +16,7 @@ SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 host-
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 
-HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config
+HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
 
 HOST_SHARED_MIME_INFO_CONF_OPT = \
 	--disable-update-mimedb
-- 
1.6.3.3
