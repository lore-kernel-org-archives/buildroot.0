From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Oct 2014 05:45:24 +0100
Subject: [Buildroot] [git commit] package/libcap: add hash file
Message-ID: <20141026044831.CCBC2AF6BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e48cfc39f1e88f113316d0854ea05ed0faf2c83d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
new file mode 100644
index 0000000..75822e5
--- /dev/null
+++ b/package/libcap/libcap.hash
@@ -0,0 +1,2 @@
+# https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
+sha256	cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65	libcap-2.24.tar.xz
