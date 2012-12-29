From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:42:31 +0100
Subject: [Buildroot] [PATCH 5/7] docs/manual: remove incorrect prerequites
In-Reply-To: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1356792153-24033-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The development files for zlib or netpbm are not needed, and neither
is python-xcbgen. None of these are present in the chroot used in the
autobuilders, and anyway if those would be needed, it would be a
Buildroot bug and not something to be mentionned in the documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/prerequisite.txt |    5 -----
 1 file changed, 5 deletions(-)

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
-- 
1.7.9.5
