From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  8 Dec 2014 20:37:08 +0100
Subject: [Buildroot] [PATCH 2/2] libinput: add hash
In-Reply-To: <1418067428-20116-1-git-send-email-ps.report@gmx.net>
References: <1418067428-20116-1-git-send-email-ps.report@gmx.net>
Message-ID: <1418067428-20116-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libinput/libinput.hash

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
new file mode 100644
index 0000000..fa246d4
--- /dev/null
+++ b/package/libinput/libinput.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/wayland-devel/2014-December/018750.html
+sha256 129f485afe5e4a9394641293991c97cb99f5f3338340d0d65b704ff463d1579e  libinput-0.7.0.tar.xz
-- 
2.1.2
