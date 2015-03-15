From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:15 +0100
Subject: [Buildroot] [PATCH 06/14]
	package/x11r7/xdriver_xf86-input-synaptics: add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash   |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
new file mode 100644
index 0000000..60dfee2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-January/002516.html
+sha256	14e7d54f81c2a2503f8acbe5e265dc336a0f2b30d007657d7afbeff979821c11	xf86-input-synaptics-1.7.8.tar.bz2
-- 
1.7.10.4
