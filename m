From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat,  6 Jan 2018 18:32:40 -0600
Subject: [Buildroot] [PATCH] python-xlib: fix LICENSE hash
Message-ID: <1515285160-8887-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resolves:
http://autobuild.buildroot.net/results/762/7627e9da786852d6b08e2fc6092a5ce3ba2f4ea0/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python-xlib/python-xlib.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index 5cb9806..2c4861a 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/python-xlib/json, sha256 locally computed
 md5 cdf342aa145c2be0ccae46cfb7b62551 python-xlib-0.21.tar.bz2
 sha256 25aad0056172920552c01a163e979b02336abaf47b0792dae9c93ecb29500431 python-xlib-0.21.tar.bz2
-sha256 5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233 LICENSE
+sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9 LICENSE
-- 
1.9.1
