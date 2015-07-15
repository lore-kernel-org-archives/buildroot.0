From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:56 -0300
Subject: [Buildroot] [PATCH 05/40] statserial: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/statserial/statserial.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/statserial/statserial.hash

diff --git a/package/statserial/statserial.hash b/package/statserial/statserial.hash
new file mode 100644
index 0000000..3cdb17d
--- /dev/null
+++ b/package/statserial/statserial.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	40cf3bd506852942aa98f468c90ed4ea66dbd343b93efacd40d617b55caf3967	statserial-1.1.tar.gz
-- 
2.3.6
