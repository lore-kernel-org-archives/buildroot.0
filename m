From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:49 -0300
Subject: [Buildroot] [PATCH 12/16] attr: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/attr/attr.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/attr/attr.hash

diff --git a/package/attr/attr.hash b/package/attr/attr.hash
new file mode 100644
index 0000000..d2d1c2e
--- /dev/null
+++ b/package/attr/attr.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859	attr-2.4.47.src.tar.gz
-- 
2.0.4
