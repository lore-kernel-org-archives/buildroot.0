From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 22:42:36 +0100
Subject: [Buildroot] [git commit] docs/manual: remove incorrect prerequites
Message-ID: <20121229214338.B163A9A52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=479262599a0a91b9539bcedfe17df6cc651772ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The development files for zlib or netpbm are not needed, and neither
is python-xcbgen. None of these are present in the chroot used in the
autobuilders, and anyway if those would be needed, it would be a
Buildroot bug and not something to be mentionned in the documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/prerequisite.txt |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 17660b7..b8bc906 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -74,10 +74,5 @@ development context (further details: refer to xref:download-infra[]).
 ** +qt4+ to use the 'xconfig' interface
 ** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
 
-* Development libraries:
-** +zlib1+
-** +netpbm10+ (for +fbtest+)
-** +python-xcbgen+ (for +Matchbox+ on Debian based system)
-
 * Documentation generation tools:
 ** +asciidoc+
