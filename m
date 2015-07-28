From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:19 -0300
Subject: [Buildroot] [PATCH 078/113] polkit: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-78-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polkit/polkit.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/polkit/polkit.hash

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
new file mode 100644
index 0000000..5e133b4
--- /dev/null
+++ b/package/polkit/polkit.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5	polkit-0.103.tar.gz
-- 
2.3.6
