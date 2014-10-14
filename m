From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:47 -0300
Subject: [Buildroot] [PATCH 10/16] cifs-utils: add hash
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/cifs-utils/cifs-utils.hash

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
new file mode 100644
index 0000000..9255179
--- /dev/null
+++ b/package/cifs-utils/cifs-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	38fc63926af435dae4ebcf4406275580a692d9fb9ee3e32170317cf2ba68e6e3	cifs-utils-6.4.tar.bz2
-- 
2.0.4
