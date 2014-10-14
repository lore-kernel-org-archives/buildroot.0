From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:41 -0300
Subject: [Buildroot] [PATCH 04/16] libcurl: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcurl/libcurl.hash

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
new file mode 100644
index 0000000..7eded03
--- /dev/null
+++ b/package/libcurl/libcurl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba	curl-7.38.0.tar.bz2
-- 
2.0.4
