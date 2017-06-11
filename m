From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:26 +0200
Subject: [Buildroot] [PATCH 17/28] package/psplash: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/psplash/psplash.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/psplash/psplash.hash

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
new file mode 100644
index 000000000..8c84f6714
--- /dev/null
+++ b/package/psplash/psplash.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 a119cced0dab49dce0726ceda533f74ff8252731fcc36c3a53f876acb6e13c46  psplash-14c8f7b705de944beb4de3f296506d80871e410f.tar.gz
-- 
2.11.0
