From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 27 Mar 2017 20:07:37 +1300
Subject: [Buildroot] [PATCH 1/1] syslog-ng: Bump version header in conf
	file to 3.9
In-Reply-To: <20170326224414.2163-1-sikor6@gmail.com>
References: <20170326224414.2163-1-sikor6@gmail.com>
Message-ID: <CAFOYHZC3W8YactoB4JpyNM8yUipwy0JwzkkZZ5ttW65RmXZ_fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/03/2017 10:44 AM, "Pawel Sikora" <sikor6@gmail.com> wrote:

Package version of syslog-ng is 3.9.1.
Bumping version number in syslog-ng.conf to 3.9

Fixing warning message about configuration file being too old.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.
conf
index 0b4a860cf..a3384eebc 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.7
+ at version: 3.9

 source s_sys {
        file("/proc/kmsg" program_override("kernel"));
--


Looks good to me

Acked-by: Chris Packham <judge.packham@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170327/b5f980b8/attachment.html>
