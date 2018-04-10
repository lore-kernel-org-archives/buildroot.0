From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:36:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/libxml2: add
 license hash
Message-ID: <20180410205255.9F7B881498@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=168c91f17441395b74836a2c12988a6568da7df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fd313f8dc610fc051f3f2c416e103d9a874caaa0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 7f9e7dbd3f..217a51fc96 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	4031c1ecee9ce7ba4f313e91ef6284164885cdb69937a123f6a83bb6a72dcd38	libxml2-2.9.5.tar.gz
+# License files, locally calculated
+sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
