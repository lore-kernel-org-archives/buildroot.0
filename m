From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:55 -0300
Subject: [Buildroot] [PATCH 04/40] taglib: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/taglib/taglib.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/taglib/taglib.hash

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
new file mode 100644
index 0000000..86ac6a4
--- /dev/null
+++ b/package/taglib/taglib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a	taglib-1.9.1.tar.gz
-- 
2.3.6
