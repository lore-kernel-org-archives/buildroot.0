From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Sep 2017 12:41:41 +0200
Subject: [Buildroot] [PATCH 1/3] package/softether: fix hash
Message-ID: <20170920104143.21404-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tarball downloaded today from github does not match the checksum
which once was valid.

Comparing both
https://github.com/SoftEtherVPN/SoftEtherVPN/archive/1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
http://sources.buildroot.net/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
shows no differences in content.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/softether.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 961990bafb..1bae7e65c1 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4bdcc05fcd163eea735444283264e40b86626d24fddf110aa416f2c8cb82448b softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
+sha256 159032e69776dea3b5e9df9be147568c76fb640b754778adb173e3018f56ba20 softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
-- 
2.11.0
