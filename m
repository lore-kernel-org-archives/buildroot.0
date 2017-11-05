From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:06 +0100
Subject: [Buildroot] [git commit] package/gettext: add license hash
Message-ID: <20171105163752.0CE53811D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24835d7b4657d55b50eb8ee194f0b968cd420714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gettext/gettext.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index cff6eb1..a2ab298 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,5 @@
 # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
 md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
 sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
+# License files, locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
