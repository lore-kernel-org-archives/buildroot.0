From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:57 -0000
Subject: [Buildroot] [git commit branch/next] iostat: define license
Message-ID: <20120802195252.10E308D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4df385c269c353011081b7fb5cb57ad947fb8f6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iostat/iostat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d3efa59..dbd1633 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -6,6 +6,8 @@
 
 IOSTAT_VERSION = 2.2
 IOSTAT_SITE = http://www.linuxinsight.com/files
+IOSTAT_LICENSE = GPL
+IOSTAT_LICENSE_FILES = LICENSE
 
 iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
 
