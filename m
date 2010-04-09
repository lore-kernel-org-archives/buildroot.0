From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] Coherent naming for .mk files in fs/
Message-ID: <20100409142133.0E02920E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3474716bff31a3d287d0d3813eb7e107cedfa3ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/cpio/{cpioroot.mk => cpio.mk}             |    0
 fs/ext2/{ext2root.mk => ext2.mk}             |    0
 fs/jffs2/{jffs2root.mk => jffs2.mk}          |    0
 fs/squashfs/{squashfsroot.mk => squashfs.mk} |    0
 fs/tar/{tarroot.mk => tar.mk}                |    0
 fs/ubifs/{ubifsroot.mk => ubifs.mk}          |    0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename fs/cpio/{cpioroot.mk => cpio.mk} (100%)
 rename fs/ext2/{ext2root.mk => ext2.mk} (100%)
 rename fs/jffs2/{jffs2root.mk => jffs2.mk} (100%)
 rename fs/squashfs/{squashfsroot.mk => squashfs.mk} (100%)
 rename fs/tar/{tarroot.mk => tar.mk} (100%)
 rename fs/ubifs/{ubifsroot.mk => ubifs.mk} (100%)

diff --git a/fs/cpio/cpioroot.mk b/fs/cpio/cpio.mk
similarity index 100%
rename from fs/cpio/cpioroot.mk
rename to fs/cpio/cpio.mk
diff --git a/fs/ext2/ext2root.mk b/fs/ext2/ext2.mk
similarity index 100%
rename from fs/ext2/ext2root.mk
rename to fs/ext2/ext2.mk
diff --git a/fs/jffs2/jffs2root.mk b/fs/jffs2/jffs2.mk
similarity index 100%
rename from fs/jffs2/jffs2root.mk
rename to fs/jffs2/jffs2.mk
diff --git a/fs/squashfs/squashfsroot.mk b/fs/squashfs/squashfs.mk
similarity index 100%
rename from fs/squashfs/squashfsroot.mk
rename to fs/squashfs/squashfs.mk
diff --git a/fs/tar/tarroot.mk b/fs/tar/tar.mk
similarity index 100%
rename from fs/tar/tarroot.mk
rename to fs/tar/tar.mk
diff --git a/fs/ubifs/ubifsroot.mk b/fs/ubifs/ubifs.mk
similarity index 100%
rename from fs/ubifs/ubifsroot.mk
rename to fs/ubifs/ubifs.mk
-- 
1.6.3.3
