From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  5 Jul 2017 20:25:25 +0530
Subject: [Buildroot] [PATCH 5/7] gupnp-av: add hash for license file
In-Reply-To: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1499266527-11091-5-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/gupnp-av/gupnp-av.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 8fe7782..e106b18 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.10.sha256sum:
 sha256	8038ef84dddbe7ad91c205bf91dddf684f072df8623f39b6555a6bb72837b85a	gupnp-av-0.12.10.tar.xz
+
+# Hash for license file:
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
-- 
2.7.4
