From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:31:05 +0200
Subject: [Buildroot] [git commit] libgcrypt: add hash file
Message-ID: <20141007103613.1DCE1B0E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=766435b7228b9f153c4d472e0c621bc6cec56fd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
new file mode 100644
index 0000000..2ce7a67
--- /dev/null
+++ b/package/libgcrypt/libgcrypt.hash
@@ -0,0 +1,2 @@
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2014q3/000355.html
+sha1	cc31aca87e4a3769cb86884a3f5982b2cc8eb7ec	libgcrypt-1.6.2.tar.bz2
