From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:04 -0300
Subject: [Buildroot] [PATCH 063/113] netplug: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-63-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netplug/netplug.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/netplug/netplug.hash

diff --git a/package/netplug/netplug.hash b/package/netplug/netplug.hash
new file mode 100644
index 0000000..16a98b7
--- /dev/null
+++ b/package/netplug/netplug.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5180dfd9a7d3d0633a027b0a04f01b45a6a64623813cd48bd54423b90814864e	netplug-1.2.9.2.tar.bz2
-- 
2.3.6
