From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 30 Jun 2017 18:50:36 +0200
Subject: [Buildroot] [PATCH] 2017.02.x: update hash file for libnl 3.2.27
	patch
Message-ID: <1498841436-24941-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Corresponding patch is generated on the fly by github. It seems like
generation method has changed, resulting to slightly different patch,
so update BR hash file accordingly.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/libnl/libnl.hash | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index eafba4a..9b6b512 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,3 +1,4 @@
 # From https://github.com/thom311/libnl/releases/download/libnl3_2_27/libnl-3.2.27.tar.gz.sha256sum
 sha256	4bbbf92b3c78a90f423cf96260bf419a28b75db8cced47051217a56795f58ec6	libnl-3.2.27.tar.gz
-sha256	b7bb929194eefc56c786a7e1ae5176b54713f9013ccec63760f232742ae80361	3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
+# Locally computed
+sha256	a308873157080f1e2e6693b2a151e15d8dfe77884b073ba3dc9bd42772dd1aef	3e18948f17148e6a3c4255bdeaaf01ef6081ceeb.patch
-- 
2.1.4
