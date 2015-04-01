From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:53:41 +0200
Subject: [Buildroot] [git commit] toolchain-common: drop BR2_LARGEFILE
Message-ID: <20150401205856.6A41881918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cb087b28b1e28c548dedb90b7031596347955f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's now unused so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 7eb22ce..13c684d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,10 +5,6 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
-config BR2_LARGEFILE
-	bool
-	default y
-
 config BR2_INET_IPV6
 	bool
 
