From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:50 -0300
Subject: [Buildroot] [PATCH 13/16] bridge-utils: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bridge-utils/bridge-utils.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/bridge-utils/bridge-utils.hash

diff --git a/package/bridge-utils/bridge-utils.hash b/package/bridge-utils/bridge-utils.hash
new file mode 100644
index 0000000..c85fd04
--- /dev/null
+++ b/package/bridge-utils/bridge-utils.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/bridge/files/bridge/
+md5	ec7b381160b340648dede58c31bb2238	bridge-utils-1.5.tar.gz
+sha1	19d2a58cd3a70f971aa931b40256174a847e60d6	bridge-utils-1.5.tar.gz
-- 
2.0.4
