From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:28:54 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] docs/manual: add
 external.desc to list of files needed for BR2_EXTERNAL
Message-ID: <20181114222614.20A2183675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=712f4b301e6233cdec89bde2e4fd2b0528a98b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

external.desc must be present when using a br2-external tree. The
documentation notes this later in the text, but the file is missing
from the initial overview of files.

Fixes bug #11481.

Signed-off-by: Philipp Wagner <mail@philipp-wagner.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a6479d6058b75533dd68081d90cec0dbfe652ca4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-directory-structure.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index b177319f98..a3a7ad4cb9 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -50,6 +50,7 @@ to you.
 |
 +-- Config.in (if using a br2-external tree)
 +-- external.mk (if using a br2-external tree)
++-- external.desc (if using a br2-external tree)
 ------
 
 Details on the files shown above are given further in this chapter.
