From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 11:28:28 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/xterm: security
 bump version to 367
Message-ID: <20210520090953.B08797FFFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e44576e07b4c281dd9f63169614416fe0af23c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes CVE-2021-27135:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-27135

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 576beb7c0afc46e2b711a84358977e1ecca4cd6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 588b7fca51..d6d80ad977 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e  xterm-366.tgz
+sha256  27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f  xterm-367.tgz
 # Locally calculated
 sha256  dfb668cc977e24649500f3cc54de3e2b793928d210715a445ab1227930b07ba6  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 6f142a0b56..e09d350a7d 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 366
+XTERM_VERSION = 367
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
