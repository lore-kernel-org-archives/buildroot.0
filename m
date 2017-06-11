From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:19 +0200
Subject: [Buildroot] [PATCH 10/28] package/libilbc: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libilbc/libilbc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libilbc/libilbc.hash

diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
new file mode 100644
index 000000000..e6789c5e8
--- /dev/null
+++ b/package/libilbc/libilbc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 70cd6a4f6bbe6dcebfc4293eea7b6200f883d1bf0affa1efba819d44d274e35f  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
-- 
2.11.0
