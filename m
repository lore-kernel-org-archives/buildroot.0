From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Dec 2015 11:57:08 +0000
Subject: [Buildroot] [PATCH 3/3] qemu: fix project's URL
In-Reply-To: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1450353428-57815-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://qemu.org and http://www.qemu.org redirects to
http://wiki.qemu.org/Main_Page, so let's use this one instead.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qemu/Config.in      | 2 +-
 package/qemu/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index aced2be..dc3fd9e 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_QEMU
 	  KVM, QEMU can virtualize x86, server and embedded PowerPC, and
 	  S390 guests.
 
-	  http://qemu.org/
+	  http://wiki.qemu.org/Main_Page
 
 if BR2_PACKAGE_QEMU
 
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index e9b944b..4c0d877 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -15,4 +15,4 @@ config BR2_PACKAGE_HOST_QEMU
 	  This option builds a user emulator for your selected
 	  architecture.
 
-	  http://www.qemu.org
+	  http://wiki.qemu.org/Main_Page
-- 
2.4.10
