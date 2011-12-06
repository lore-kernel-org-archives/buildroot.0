From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Dec 2011 10:00:46 +0100
Subject: [Buildroot] [git commit] fs/skeleton: make /var/lib/misc a symlink
	to /tmp
Message-ID: <20111206090153.C65248F72F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe83751e8fcbe1c3b1883c1773c2e0e7a520730b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the other symlinks, so you can use E.G. dnsmasq with a read
only rootfs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/var/lib/misc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/var/lib/misc b/fs/skeleton/var/lib/misc
new file mode 120000
index 0000000..f1fde8c
--- /dev/null
+++ b/fs/skeleton/var/lib/misc
@@ -0,0 +1 @@
+../../tmp
\ No newline at end of file
