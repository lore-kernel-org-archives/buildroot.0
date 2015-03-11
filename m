From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 22:16:43 +0100
Subject: [Buildroot] [git commit] avahi: add hash file
Message-ID: <20150311213915.A9E8E7FFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4014c9102e71fc59f703013a4e9ee936cf59f6d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Help counteract upstream website issues, fixes:
http://autobuild.buildroot.net/results/103/103e5a62d16ed22414cc407eff8a78d5e8d7503c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Andr?? Hentschel <nerv@dawncrow.de>
Reviewed-by: Andr?? Hentschel <nerv@dawncrow.de>
Acked-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
new file mode 100644
index 0000000..99bbd51
--- /dev/null
+++ b/package/avahi/avahi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48	avahi-0.6.31.tar.gz
