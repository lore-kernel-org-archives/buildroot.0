From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:53 -0300
Subject: [Buildroot] [PATCH 112/113] dmidecode: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-112-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dmidecode/dmidecode.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dmidecode/dmidecode.hash

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
new file mode 100644
index 0000000..7098ed0
--- /dev/null
+++ b/package/dmidecode/dmidecode.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5a8214b99c1762f4510bd92baa279336e5fed6e5cd2e418d46d95a4ecc783922	dmidecode-2.12.tar.gz
-- 
2.3.6
