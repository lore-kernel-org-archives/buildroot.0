From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:15 -0300
Subject: [Buildroot] [PATCH 24/40] libsamplerate: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-24-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsamplerate/libsamplerate.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsamplerate/libsamplerate.hash

diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
new file mode 100644
index 0000000..a495108
--- /dev/null
+++ b/package/libsamplerate/libsamplerate.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06	libsamplerate-0.1.8.tar.gz
-- 
2.3.6
