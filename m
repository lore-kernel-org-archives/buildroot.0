From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 18:40:31 +0200
Subject: [Buildroot] [git commit] skeleton/root/.bash_profile: don't set PATH
Message-ID: <20141025164228.C9A7FAD342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34853976f906a5d7fc4e1b23d64c43518863875a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if the main shell is bash /etc/profile is also parsed so it's
redundant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/root/.bash_profile |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
index 27bf149..0ee04a3 100644
--- a/system/skeleton/root/.bash_profile
+++ b/system/skeleton/root/.bash_profile
@@ -1,13 +1,5 @@
 # .bash_profile
 
-export PATH=\
-/bin:\
-/sbin:\
-/usr/bin:\
-/usr/sbin:\
-/usr/bin/X11:\
-/usr/local/bin
-
 umask 022
 
 if [ -f ~/.bashrc ]; then
