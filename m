From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:39:09 +0200
Subject: [Buildroot] [git commit] polarssl: add hash
Message-ID: <20140918195020.E69A09D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31df0ffb8b31c8e369ddf7f8a2f9c3788904f4c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polarssl/polarssl.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
new file mode 100644
index 0000000..ca437ac
--- /dev/null
+++ b/package/polarssl/polarssl.hash
@@ -0,0 +1,3 @@
+# From https://polarssl.org/tech-updates/releases/polarssl-1.2.11-released
+sha1	40cb3a833245273946c2075e6c948bbcda8a1be9	polarssl-1.2.11-gpl.tgz
+sha256	b3e9d059c687980976b468d8260f658e9003aede1dbc4a918526e90abdaa7d75	polarssl-1.2.11-gpl.tgz
