From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:19:26 +0200
Subject: [Buildroot] [git commit] rrdtool: bump to version 1.5.6
Message-ID: <20160419191929.A7FB081E21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5b8010eb83f4a700e991aa6aa7957a40d359f9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rrdtool/rrdtool.hash | 2 +-
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 36ac50c..97741c9 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3a286d449c05d657e3fc3adcaa5cb4f0cfac8f465324b14f364a45d4ff8ca6f6	rrdtool-1.5.5.tar.gz
+sha256	9832775479684b8f94767201ee0440a1cacdbbbb7dd6736eb96b9a0750644ce8	rrdtool-1.5.6.tar.gz
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 0bc7c38..6d6ab0c 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.5.5
+RRDTOOL_VERSION = 1.5.6
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
