From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:49 +0100
Subject: [Buildroot] [PATCH 14/31] package/gettext: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-15-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gettext/gettext.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index cff6eb1090..340f6fc959 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,5 @@
 # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
 md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
 sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
+# Locally computed
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-- 
2.15.0
