From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 18:40:25 +0200
Subject: [Buildroot] [git commit] skeleton/etc/profile: remove /usr/bin/X11
	from PATH
Message-ID: <20141025164228.C1A23AF438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfad612fc7b2f53b265e7ed56134fbc4fdbc7151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That directory has been unused for ages so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/profile |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 31d3180..640f6f1 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -5,7 +5,6 @@ export PATH=\
 /sbin:\
 /usr/bin:\
 /usr/sbin:\
-/usr/bin/X11:\
 /usr/local/bin
 
 # If running interactively, then:
