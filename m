From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:43:48 +0200
Subject: [Buildroot] [git commit] scancpan: update old reference to
	support/scripts
Message-ID: <20170701174125.CE0158195B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c2428616eaa265ab5af3f4fde7cd9dbe6d98876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

scancpan's help text refers to its location, so update it after the
move to utils/.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 62df225..9ccbac5 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -752,7 +752,7 @@ __END__
 
 =head1 NAME
 
-support/scripts/scancpan Try-Tiny Moo
+utils/scancpan Try-Tiny Moo
 
 =head1 SYNOPSIS
 
