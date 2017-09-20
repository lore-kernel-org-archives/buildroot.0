From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 18:55:43 +0200
Subject: [Buildroot] [git commit] package/softether: fix hash
Message-ID: <20170920170648.D993180FEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d06330d3700aa34c1c05f25796fd337055b089f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tarball downloaded today from github does not match the checksum
which once was valid.

Comparing both
https://github.com/SoftEtherVPN/SoftEtherVPN/archive/1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
http://sources.buildroot.net/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
shows no differences in content.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softether/softether.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 961990b..1bae7e6 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4bdcc05fcd163eea735444283264e40b86626d24fddf110aa416f2c8cb82448b softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
+sha256 159032e69776dea3b5e9df9be147568c76fb640b754778adb173e3018f56ba20 softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
