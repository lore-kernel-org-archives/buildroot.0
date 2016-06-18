From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:26 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-cache-tab: add .hash file
Message-ID: <20160618131027.877B5817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df9a439920d37c16add022eee65a788b54a26fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-cache-tab tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
new file mode 100644
index 0000000..d8b09f9
--- /dev/null
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 752b649f695e9f2777efd6b2d8dfdcc1f435104b4e363f5f0454b99fd009015c erlang-p1-cache-tab-1.0.1.tar.gz
