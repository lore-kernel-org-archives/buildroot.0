From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 12:31:55 +0100
Subject: [Buildroot] [git commit] libcurl: drop curl* aliases
Message-ID: <20150112113158.C7D098046D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4073d1515ff31cfe4dc1b7e78a8ed0d03a0ebd85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They're unused hence not useful.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index db5fdb7..014c5e3 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -67,8 +67,3 @@ LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
 $(eval $(autotools-package))
-
-curl: libcurl
-curl-clean: libcurl-clean
-curl-dirclean: libcurl-dirclean
-curl-source: libcurl-source
