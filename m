From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jan 2021 10:42:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-mwclient: fix legal info
Message-ID: <20210103094219.5242-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed due to upstream commit
https://github.com/mwclient/mwclient/commit/213ecd23c77a6e60e1996a33cfafae1e467ee2ff

Fixes:
http://autobuild.buildroot.net/results/d40/d40f3a5122e758aaa5ff7b10d273908849e27bc7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-mwclient/python-mwclient.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 1baa9e9db9..354bd685e4 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -2,4 +2,4 @@
 md5  148bd36bfaaf591bd9c0076cbf1ed888  mwclient-0.10.1.tar.gz
 sha256  79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139  mwclient-0.10.1.tar.gz
 # Locally computed
-sha256  0e713ce8e3e490bdc15ac1e59feba3009daef3fff10dd80d8baa6e5f9a294f32  LICENSE.md
+sha256  67689d1fd48a5adba31272eed653c12160dd3abbfe92ab056ac42a155e12e523  LICENSE.md
-- 
2.29.2
