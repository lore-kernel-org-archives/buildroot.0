From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:48 -0300
Subject: [Buildroot] [PATCH 047/113] libyaml: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-47-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libyaml/libyaml.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libyaml/libyaml.hash

diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
new file mode 100644
index 0000000..fd039fa
--- /dev/null
+++ b/package/libyaml/libyaml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749	yaml-0.1.6.tar.gz
-- 
2.3.6
