From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 20:17:24 +0200
Subject: [Buildroot] [git commit] cgilua: bump to version 5.2.1
Message-ID: <20170902181006.E070681D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8bcc8ad93745ea9bdcd13c076fec1f3e27b9dee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgilua/cgilua.hash | 2 +-
 package/cgilua/cgilua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cgilua/cgilua.hash b/package/cgilua/cgilua.hash
index 786791d..b932e80 100644
--- a/package/cgilua/cgilua.hash
+++ b/package/cgilua/cgilua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8e9ef583f8e1c5b600ebc6bb04924a61f72320130410191a9c56d7295fb02be1  cgilua-5.1.4-2.src.rock
+sha256 7d4883e6a89b3463a1d35b8084a6e2afbbb584af7aca1169380e92af0f848413  cgilua-5.2.1-1.src.rock
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 5934ffd..73006ff 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.1.4-2
+CGILUA_VERSION = 5.2.1-1
 CGILUA_LICENSE = MIT
 
 $(eval $(luarocks-package))
