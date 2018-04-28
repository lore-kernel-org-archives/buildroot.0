From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 16:35:19 +0200
Subject: [Buildroot] [PATCH 1/1] libcli: add hash for license file
Message-ID: <20180428143519.29343-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcli/libcli.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
index f6ea12ad37..729c636960 100644
--- a/package/libcli/libcli.hash
+++ b/package/libcli/libcli.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3c801cb0112b6b5e07bdc3b98c034b36df6f33a8ed95ce74520b704bdbc0f36d  libcli-c63c9d35144939c8b4fa3c5394aed2e29ff517b0.tar.gz
+sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
-- 
2.14.1
