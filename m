From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2012 22:55:11 +0100
Subject: [Buildroot] [PATCH] system/skeleton: add the shadow-group file
Message-ID: <1356904511-22452-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/gshadow is to /etc/group what /etc/shadow is to /etc/passwd.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/skeleton/etc/gshadow |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 system/skeleton/etc/gshadow

diff --git a/system/skeleton/etc/gshadow b/system/skeleton/etc/gshadow
new file mode 100644
index 0000000..0af6dad
--- /dev/null
+++ b/system/skeleton/etc/gshadow
@@ -0,0 +1,21 @@
+root:*::
+daemon:*::
+bin:*::
+sys:*::
+adm:*::
+tty:*::
+disk:*::
+wheel:*::
+audio:*::
+www-data:*::
+utmp:*::
+staff:*::
+lock:*::
+haldaemon:*::
+dbus:*::
+netdev:*::
+ftp:*::
+nobody:*::
+nogroup:*::
+users:*::
+default:*::
-- 
1.7.2.5
