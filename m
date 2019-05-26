From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:28:24 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/rpm: replace
 utf-8 space by ascii character
Message-ID: <20190526072358.0149D8E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d291f30edeeca3e25385698aef40c3d00264f020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 80ff8f5ee8651a065c9b7a436cd9ccad05c7b156)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index b550e12721..f7cbd0cbc3 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
 # From https://rpm.org/wiki/Releases/4.14.2.1.html
 sha256 1139c24b7372f89c0a697096bf9809be70ba55e006c23ff47305c1849d98acda  rpm-4.14.2.1.tar.bz2
 
-#??Hash for license file
+# Hash for license file
 sha256 d56f4f1f290f6920cb053aef0dbcd0b853cda289e2568b364ddbfce220a6f3e0  COPYING
