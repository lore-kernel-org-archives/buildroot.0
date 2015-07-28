From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:27 -0300
Subject: [Buildroot] [PATCH 086/113] python-pycrypto: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-86-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-pycrypto/python-pycrypto.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-pycrypto/python-pycrypto.hash

diff --git a/package/python-pycrypto/python-pycrypto.hash b/package/python-pycrypto/python-pycrypto.hash
new file mode 100644
index 0000000..e7f809a
--- /dev/null
+++ b/package/python-pycrypto/python-pycrypto.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7293c9d7e8af2e44a82f86eb9c3b058880f4bcc884bf3ad6c8a34b64986edde8	pycrypto-2.6.tar.gz
-- 
2.3.6
