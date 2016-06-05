From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:43:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/softether: add hash
Message-ID: <1465163003-19156-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added hashes for patch files

 package/softether/softether.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/softether/softether.hash

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
new file mode 100644
index 0000000..ecc5d25
--- /dev/null
+++ b/package/softether/softether.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256 4bdcc05fcd163eea735444283264e40b86626d24fddf110aa416f2c8cb82448b softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
+sha256 fe5ff8f13b42737dfd5eb53f14c55aed714c380f181a1ae112055b04e8c97229 c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch
+sha256 b5a8750426387b9211754b199f7f9f6a013dba6a1cd731c210a205679ffa1d1c 75625af541fd128f51079d0ffe5ef24645b8f421.patch
-- 
2.8.1
