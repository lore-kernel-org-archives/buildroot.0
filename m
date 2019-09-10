From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:35:35 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: update version in
 config file
Message-ID: <20190910173108.B09A58DF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1ddf5c82b268d279d358645bd5d80bb718edd0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syslog-ng warns when using a configuration from an older version. Update
the version in the example config.

Fixes: 9695f3e069 ("package/syslog-ng: bump version to 3.22.1")
Signed-off-by: Chris Packham <judge.packham@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 9a56a1302d..cab3a7e75a 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.19
+ at version: 3.22
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
