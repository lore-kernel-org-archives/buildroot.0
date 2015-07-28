From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:32 -0300
Subject: [Buildroot] [PATCH 091/113] rpm: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-91-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rpm/rpm.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rpm/rpm.hash

diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
new file mode 100644
index 0000000..0665746
--- /dev/null
+++ b/package/rpm/rpm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	34a959c0ed670cadcdc52c6025e822fac6f5d1015e3b75123f53ebe53b923e98	rpm-5.2.0.tar.gz
-- 
2.3.6
