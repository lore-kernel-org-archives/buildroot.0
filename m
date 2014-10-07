From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:30:34 +0200
Subject: [Buildroot] [git commit] gnupg2: add hash file
Message-ID: <20141007103613.16D60B0E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57963519daf1acff9b453081bfc1e340adb0e1df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
new file mode 100644
index 0000000..62fdaee
--- /dev/null
+++ b/package/gnupg2/gnupg2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0	gnupg-2.0.26.tar.bz2
