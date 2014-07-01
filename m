From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:29:02 +0200
Subject: [Buildroot] [git commit] latencytop: add license information
Message-ID: <20140701224921.C0B9E9D132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1abcffbf9d862eec2709a55358db311a64be09a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/latencytop/latencytop.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index a19f48a..7b96c2b 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -7,6 +7,8 @@
 LATENCYTOP_VERSION = 0.5
 LATENCYTOP_SITE = http://www.latencytop.org/download/
 LATENCYTOP_DEPENDENCIES = libglib2 ncurses
+LATENCYTOP_LICENSE = GPLv2
+LATENCYTOP_LICENSE_FILES = latencytop.c
 
 # NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
 # version only
