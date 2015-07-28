From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:39 -0300
Subject: [Buildroot] [PATCH 098/113] sylpheed: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-98-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sylpheed/sylpheed.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sylpheed/sylpheed.hash

diff --git a/package/sylpheed/sylpheed.hash b/package/sylpheed/sylpheed.hash
new file mode 100644
index 0000000..39c0927
--- /dev/null
+++ b/package/sylpheed/sylpheed.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	4aeb7c6436ad485a2cc101dd68a1fb84abcad4c6471ed9ddefec65e482e5b2b1	sylpheed-3.2.0.tar.bz2
-- 
2.3.6
