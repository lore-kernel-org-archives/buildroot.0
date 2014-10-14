From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:48 -0300
Subject: [Buildroot] [PATCH 11/16] acl: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/acl/acl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/acl/acl.hash

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
new file mode 100644
index 0000000..3f9d790
--- /dev/null
+++ b/package/acl/acl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23	acl-2.2.52.src.tar.gz
-- 
2.0.4
