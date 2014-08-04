From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] inadyn: add comment mmu depends
Message-ID: <20140804163002.6DE159D1A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=524d20abd970430d120e4640aed198df503cb3d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inadyn/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index a436111..c1f7a77 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -11,3 +11,4 @@ config BR2_PACKAGE_INADYN
 
 comment "inadyn needs a toolchain w/ dynamic library"
         depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
