From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:36:49 +0200
Subject: [Buildroot] [git commit] busybox: add hash
Message-ID: <20140918195020.DC1FD9D6E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10153cc0f70eb3e59e893708aa94c65ee93a6ef9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And rename 0006-lzop-add-overflow-check.patch to the proper convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ... => busybox-0006-lzop-add-overflow-check.patch} |    0
 package/busybox/busybox.hash                       |    3 +++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/busybox/0006-lzop-add-overflow-check.patch b/package/busybox/busybox-0006-lzop-add-overflow-check.patch
similarity index 100%
rename from package/busybox/0006-lzop-add-overflow-check.patch
rename to package/busybox/busybox-0006-lzop-add-overflow-check.patch
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
new file mode 100644
index 0000000..428ce0a
--- /dev/null
+++ b/package/busybox/busybox.hash
@@ -0,0 +1,3 @@
+# From http://busybox.net/downloads/busybox-1.22.1.tar.bz2.sign
+md5	337d1a15ab1cb1d4ed423168b1eb7d7e	busybox-1.22.1.tar.bz2
+sha1	d6e96fefb6f0fb8079f27468b9bf22d8dd96108e	busybox-1.22.1.tar.bz2
