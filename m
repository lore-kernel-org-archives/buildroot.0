From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 19:25:15 +0200
Subject: [Buildroot] [git commit] mpfr: add hash file
Message-ID: <20141019172550.9778AAFD61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a30ec5251ed53bd43dbb20da7de5d4437c81cf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpfr/mpfr.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
new file mode 100644
index 0000000..ea18780
--- /dev/null
+++ b/package/mpfr/mpfr.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	399d0f47ef6608cc01d29ed1b99c7faff36d9994c45f36f41ba250147100453b	mpfr-3.1.2.tar.xz
