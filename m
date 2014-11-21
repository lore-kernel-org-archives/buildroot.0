From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 13:12:08 +0100
Subject: [Buildroot] [git commit] CHANGES: Update with recent changes
Message-ID: <20141121121220.2AAFE7FDF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dfba6f545c4fb282c4a3c0a812d68e0923eed92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9e8c4d8..a13707b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2014.11, Not yet released:
+
+	Fixes all over the tree.
+
+	Inittab tweaks for shutdown handling (busybox and sysvinit).
+
+	Updated/fixed packages: aircrack-ng, botan, canfestival,
+	clamav, coreutils, czmq, dbus, dovecot, duma, e2fsprogs,
+	erlang, gcc, iputils, libcap, libgcrypt, libmemcached,
+	libssh2, libunwind, libv4l, linux-headers, mesa3d-demos, mutt,
+	mysql, ndisc6, nodejs, omniorb, perl-cross, php,
+	python-tornado, python3, qemu, qt5base, qt5webkit, rpm,
+	rt-tests, ruby, schifra, sdl_sound, shairport-sync, sysvinit,
+	tstools, tzdata, wireshark, x264
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7646: strftime on datetime not works on python3
+
 2014.11-rc1, Released November 12th, 2014
 
 	Fixes all over the tree and new features.
