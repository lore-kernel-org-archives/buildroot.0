From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  7 Oct 2014 21:59:54 +0300
Subject: [Buildroot] [PATCH] openssh: mention release announcement in hash
	file
Message-ID: <2572b1b40cd15dfb321188225308bc7cd4c42da8.1412708393.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, add sha1 hash from the announcement.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openssh/openssh.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0b57d482e410..2fcdabef0290 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
+# Also from http://www.openssh.com/txt/release-6.7 (sha256 is base64 encoded)
+sha1	14e5fbed710ade334d65925e080d1aaeb9c85bf6	openssh-6.7p1.tar.gz
 sha256	b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507	openssh-6.7p1.tar.gz
-- 
2.1.1
