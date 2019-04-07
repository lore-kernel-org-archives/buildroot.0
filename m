From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 08:07:15 +0200
Subject: [Buildroot] [git commit] package/gerbera: fix hash
Message-ID: <20190407060627.8E6AB82B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=052fa49d4725596f1e83c0a8dedc91d387d57b7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d4af0a277dc293ab0f9d7b4e1dd801fd6d00f2d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gerbera/gerbera.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index 5bbd8826b1..aa6a29f81e 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	89bbcebcf6beebb50b9453329b13e6a20e3e505dee5655486e90e1f085591f4a	gerbera-v1.3.1.tar.gz
+sha256	9c4509189eab6bff0fe183e1dd54ea8cb17d7fb0bc6e21bb5b1a8ccaaf6c60d9	gerbera-v1.3.1.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
