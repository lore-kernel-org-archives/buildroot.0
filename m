From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:43:40 +0200
Subject: [Buildroot] [git commit] openssl: add hash
Message-ID: <20140918195021.1EBDF9D6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d242e6d4712b3cb34aec70b99ffb78c1b292b776
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
new file mode 100644
index 0000000..aa45a76
--- /dev/null
+++ b/package/openssl/openssl.hash
@@ -0,0 +1,4 @@
+# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.md5
+# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.sha1
+md5	c8dc151a671b9b92ff3e4c118b174972	openssl-1.0.1i.tar.gz
+sha1	74eed314fa2c93006df8d26cd9fc630a101abd76	openssl-1.0.1i.tar.gz
