From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 23:34:26 +0200
Subject: [Buildroot] [git commit] package/jasper: fix tarball name in hash
 file
Message-ID: <20201006212433.D01FE8E39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=245c643fc74435e6a97d8bd502bbccb171127a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tarball name was not updated by commit
0ca16ace62dc407f73ded69792dd6a9f22492a6e

While at it also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/1356d309d45b5eedeec375e2fdc0cf2ad7839a55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jasper/jasper.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index bb660e3c5d..5edf45e6db 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 afc4166bff29b8a0dc46ed5e8d6a208d7976fccfd0b1146e3400c8b2948794a2  jasper-2.0.21.tar.gz
-sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
+sha256  afc4166bff29b8a0dc46ed5e8d6a208d7976fccfd0b1146e3400c8b2948794a2  jasper-2.0.22.tar.gz
+sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
