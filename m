From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 23:02:58 +0200
Subject: [Buildroot] [git commit] package/lzo: add hash file
Message-ID: <20150602211231.503BC81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b946f73859238b8aa73ca1556edfda6afc0c45b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lzo/lzo.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
new file mode 100644
index 0000000..8d7c666
--- /dev/null
+++ b/package/lzo/lzo.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ac1b3e4dee46febe9fd28737eb7f5692d3232ef1a01da10444394c3d47536614 lzo-2.08.tar.gz
