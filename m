From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  5 Jul 2017 20:25:24 +0530
Subject: [Buildroot] [PATCH 4/7] gupnp: add hash for license file
In-Reply-To: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1499266527-11091-4-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/gupnp/gupnp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 48aeb49..7fb44ff 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.1.sha256sum:
 sha256	934584cc1b361bf251a5ac271ffb1995a3c6426ce44cb64f9c6d779f2af9a6d9	gupnp-1.0.1.tar.xz
+
+# Hash for license file:
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
-- 
2.7.4
