From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:43:39 +0200
Subject: [Buildroot] [git commit] package/make: fix hash type (md5 instead
	of sha1)
Message-ID: <20160603074344.C76C881F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3aa3b892aba1169618075c9d55af3d57ad59092b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/133cdeaa0644405568c3e8fc003d73c4570fbc82/
  http://autobuild.buildroot.net/results/e162f46458f4948c75550d47710bee92f1602273/
  http://autobuild.buildroot.net/results/7ca74c9ea36321e1940ee2707af5745b7d4498d2/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/make.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/make/make.hash b/package/make/make.hash
index 528822f..81f7044 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,4 +1,4 @@
 # From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html
-sha1 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
+md5 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
 # Locally calculated after checking signature
 sha256 4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f  make-4.2.tar.bz2
