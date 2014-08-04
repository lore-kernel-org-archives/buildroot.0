From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] mtools: add comment mmu depends
Message-ID: <20140804163002.A05439D3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e11cfa52b2bfe0fac62b014ea101e104e7525710
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index 5865223..e51bac1 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -12,3 +12,4 @@ config BR2_PACKAGE_MTOOLS
 
 comment "mtools needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
