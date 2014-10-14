From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:57:00 -0300
Subject: [Buildroot] [PATCH 2/5] pppd: add hash file
In-Reply-To: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284223-20630-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pppd/pppd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/pppd/pppd.hash

diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
new file mode 100644
index 0000000..2bc248d
--- /dev/null
+++ b/package/pppd/pppd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30	ppp-2.4.7.tar.gz
-- 
2.0.4
