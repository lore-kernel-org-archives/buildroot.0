From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:21:01 +0100
Subject: [Buildroot] [git commit] libsndfile: add licensing info
Message-ID: <20131211213614.88EA89BFD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=712779889920501c012eb3e9c6ef9f237bc31615
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsndfile/libsndfile.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 97a8c17..88db576 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -7,5 +7,7 @@
 LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
+LIBSNDFILE_LICENSE = LGPLv2.1+
+LIBSNDFILE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
