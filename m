From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:32 +0200
Subject: [Buildroot] [PATCH 23/28] package/dbus-triggerd: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-23-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dbus-triggerd/dbus-triggerd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dbus-triggerd/dbus-triggerd.hash

diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
new file mode 100644
index 000000000..aa4ad9791
--- /dev/null
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 3c6d865427bf1b93b16323c796ed6957ce6b2b6fd53f518b1b082d03b939102c  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09.tar.gz
-- 
2.11.0
