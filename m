From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:47:39 +0100
Subject: [Buildroot] [git commit] cramfs: add licensing info
Message-ID: <20131226175122.3208B9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a413e32ef1dad972d02c617d2e3c26edbb2d5889
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cramfs/cramfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 0f29dd0..710aaa8 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -6,6 +6,8 @@
 
 CRAMFS_VERSION = 1.1
 CRAMFS_SITE = http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
+CRAMFS_LICENSE = GPLv2+
+CRAMFS_LICENSE_FILES = COPYING
 
 CRAMFS_DEPENDENCIES = zlib
 
