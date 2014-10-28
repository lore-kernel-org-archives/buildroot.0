From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 19:08:46 +0100
Subject: [Buildroot] [git commit] system/skeleton: drop pcmcia bits
Message-ID: <20141028180904.A5325B1CC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1987e06be0d05fc424c3803385e2d8fb49a47443
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They're obsolete and the package was removed way back in 2010.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/var/lib/pcmcia |    1 -
 system/skeleton/var/pcmcia     |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/system/skeleton/var/lib/pcmcia b/system/skeleton/var/lib/pcmcia
deleted file mode 120000
index f1fde8c..0000000
--- a/system/skeleton/var/lib/pcmcia
+++ /dev/null
@@ -1 +0,0 @@
-../../tmp
\ No newline at end of file
diff --git a/system/skeleton/var/pcmcia b/system/skeleton/var/pcmcia
deleted file mode 120000
index 1431b0e..0000000
--- a/system/skeleton/var/pcmcia
+++ /dev/null
@@ -1 +0,0 @@
-../tmp
\ No newline at end of file
