From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:11:09 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] syslog-ng: Bump version
	header in conf file to 3.9
Message-ID: <20170331071607.64645826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d09c7e4d45261ef03277c9f46a07c81686f5e5bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Package version of syslog-ng is 3.9.1.
Bumping version number in syslog-ng.conf to 3.9

Fixing warning message about configuration file being too old.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3dad25466d2931eeecde23867bed79b1d7213887)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 0b4a860..a3384ee 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.7
+ at version: 3.9
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
