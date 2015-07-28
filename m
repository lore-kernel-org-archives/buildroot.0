From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:25 -0300
Subject: [Buildroot] [PATCH 084/113] python-configobj: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-84-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-configobj/python-configobj.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/python-configobj/python-configobj.hash

diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
new file mode 100644
index 0000000..e4f5c6c
--- /dev/null
+++ b/package/python-configobj/python-configobj.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi/configobj/4.7.2
+md5	201dbaa732a9049c839f9bb6c27fc7b5	configobj-4.7.2.tar.gz
+# Calculated based on the hash above
+sha256	515ff923462592e8321df8b48c47e3428f8d406ee22b8de77bef969d1af11171	configobj-4.7.2.tar.gz
-- 
2.3.6
