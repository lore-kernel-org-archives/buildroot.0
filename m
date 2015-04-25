From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 14:44:57 +0200
Subject: [Buildroot] [git commit] package/input-tools: add hash for
	joystick_20051019-5.diff.gz
Message-ID: <20150425124502.D360D80504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78553f5c07984db4ef0a86b9565a183483d552fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1f3/1f3c5c060cd98a3f4cf9688fc8a83cc1c23ece29

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/input-tools/input-tools.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/input-tools/input-tools.hash b/package/input-tools/input-tools.hash
index c82cae3..53b0f92 100644
--- a/package/input-tools/input-tools.hash
+++ b/package/input-tools/input-tools.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick/joystick_20051019-12.dsc
 sha256	cb60cb62093f1889a91fcef1cc36546aba406f451941e8d057f095639e6afb89	joystick_20051019.orig.tar.gz
+# From http://snapshot.debian.org/archive/debian/20090630T220234Z/pool/main/j/joystick/joystick_20051019-5.dsc
+sha256	01e9d14a656d594a3e261751233200f740a09c2a538ac71447c104ffe89ec10c	joystick_20051019-5.diff.gz
