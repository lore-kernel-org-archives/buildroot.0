From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Sep 2014 09:46:10 +0200
Subject: [Buildroot] [git commit] Makefile: Unexport MACHINE variable
Message-ID: <20140925074631.E4B639D770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d3b975653eee06d48f61dde4777e7c5d6abda92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug 7448

Otherwise glibc build fails.

[Peter: reworded]
Signed-off-by: Risto Avila <risto.avila@digia.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index e788f1b..53f8ad5 100644
--- a/Makefile
+++ b/Makefile
@@ -292,6 +292,7 @@ unexport TAR_OPTIONS
 unexport CONFIG_SITE
 unexport QMAKESPEC
 unexport TERMINFO
+unexport MACHINE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
