From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 21:59:57 +0200
Subject: [Buildroot] [git commit] dado: bump to version 1.8.3
Message-ID: <20170902195514.DBC777FD69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=659fe72525b1b609eadd6069258848a64fab6fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dado/dado.hash | 2 +-
 package/dado/dado.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dado/dado.hash b/package/dado/dado.hash
index 984ef3f..973bdb3 100644
--- a/package/dado/dado.hash
+++ b/package/dado/dado.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	dea331051c92ef2fbb22025a4f02e84e63d63148a66589401404877727f59941  dado-1.8.0-1.src.rock
+sha256 5a10ed7ff7be34ac004d10d6ea62ee8efc2b594c50ffc93e840e7fb7a2e6b4d0  dado-1.8.3-1.src.rock
diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index 7ae4edf..acef047 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DADO_VERSION = 1.8.0-1
+DADO_VERSION = 1.8.3-1
 DADO_LICENSE = MIT
 
 $(eval $(luarocks-package))
