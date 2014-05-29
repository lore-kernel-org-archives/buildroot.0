From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 23:21:15 +0200
Subject: [Buildroot] [git commit] manual: Fix BR2_GLOBAL_PATCH_DIR example
Message-ID: <20140529212159.5BFA59CE40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70c7fbf0ae345e26fbe8b9dbc59745ec63c6a5b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on irc, there is a missing part in the BR2_GLOBAL_PATCH_DIR
    example compared to the ASCII figure under customize-packages section.

Signed-off-by: Sebastien Roy <sebastien.roy@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-packages.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 6f70bdb..b4ed0b5 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -86,7 +86,7 @@ If the user has the +BR2_GLOBAL_PATCH_DIR+ configuration option set as
 follows:
 
 -----
-BR2_GLOBAL_PATCH_DIR="board/common-fooarch board/fooarch-board"
+BR2_GLOBAL_PATCH_DIR="board/common-fooarch/patches board/fooarch-board/patches"
 -----
 
 Then the patches would applied as follows for the Linux kernel:
