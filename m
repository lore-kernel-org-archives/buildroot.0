From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 16 Dec 2019 12:46:22 +0000
Subject: [Buildroot] [PATCH 2/3] boot/at91bootstrap3: add hash for 3.8.10
 version
In-Reply-To: <1576500357-21964-1-git-send-email-eugen.hristev@microchip.com>
References: <1576500357-21964-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <1576500357-21964-2-git-send-email-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eugen Hristev <eugen.hristev@microchip.com>

3.8.10 is still used by some boards. It needs a hash to cope with
the custom tarball download system.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 boot/at91bootstrap3/at91bootstrap3.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 93f495f468..608f431bc3 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,3 @@
 # Locally calculated
+sha256	0e868265e9f71b6a742ed97851c9944bb7179c232ded61ea3ec226db46b6507a  at91bootstrap3-v3.8.10.tar.gz
 sha256	9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e  at91bootstrap3-v3.9.0.tar.gz
-- 
2.17.1
