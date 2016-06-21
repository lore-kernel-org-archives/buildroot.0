From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jun 2016 09:51:49 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: place
	package/Config.in entry into alphabetical order
Message-ID: <20160621075244.279C882116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9bd5a7be9c9df356385c093cc78a64ee0e3f5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index ce71afb..171f4ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -736,6 +736,7 @@ menu "External python modules"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
+	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
@@ -758,7 +759,6 @@ menu "External python modules"
 	source "package/python-six/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-spidev/Config.in"
-	source "package/python-pytablewriter/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-treq/Config.in"
