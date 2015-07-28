From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:12 +0200
Subject: [Buildroot] [git commit branch/next] python-pycrypto: add hash file
Message-ID: <20150808105648.02F757FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4457c7c43a208333548e3f8225482239a8a37293
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycrypto/python-pycrypto.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-pycrypto/python-pycrypto.hash b/package/python-pycrypto/python-pycrypto.hash
new file mode 100644
index 0000000..e7f809a
--- /dev/null
+++ b/package/python-pycrypto/python-pycrypto.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7293c9d7e8af2e44a82f86eb9c3b058880f4bcc884bf3ad6c8a34b64986edde8	pycrypto-2.6.tar.gz
