From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 16:22:26 +0200
Subject: [Buildroot] [git commit] libnet-* rename .mk files according to
	package name
Message-ID: <20131022142610.E08019BAF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfc505c079efbee6bea5a97fa79faa9fc716c6c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ux.patch => libnetfilter_acct-01-uclinux.patch} |    0
 .../{libnetfilter-acct.mk => libnetfilter_acct.mk} |    0
 ...tch => libnetfilter_conntrack-01-uclinux.patch} |    0
 ...lter-conntrack.mk => libnetfilter_conntrack.mk} |    0
 ...atch => libnetfilter_cthelper-01-uclinux.patch} |    0
 ...filter-cthelper.mk => libnetfilter_cthelper.mk} |    0
 ...tch => libnetfilter_cttimeout-01-uclinux.patch} |    0
 ...lter-cttimeout.mk => libnetfilter_cttimeout.mk} |    0
 ...nux.patch => libnetfilter_log-01-uclinux.patch} |    0
 .../{libnetfilter-log.mk => libnetfilter_log.mk}   |    0
 ...x.patch => libnetfilter_queue-01-uclinux.patch} |    0
 ...libnetfilter-queue.mk => libnetfilter_queue.mk} |    0
 12 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libnetfilter_acct/libnetfilter-acct-01-uclinux.patch b/package/libnetfilter_acct/libnetfilter_acct-01-uclinux.patch
similarity index 100%
rename from package/libnetfilter_acct/libnetfilter-acct-01-uclinux.patch
rename to package/libnetfilter_acct/libnetfilter_acct-01-uclinux.patch
diff --git a/package/libnetfilter_acct/libnetfilter-acct.mk b/package/libnetfilter_acct/libnetfilter_acct.mk
similarity index 100%
rename from package/libnetfilter_acct/libnetfilter-acct.mk
rename to package/libnetfilter_acct/libnetfilter_acct.mk
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack-01-uclinux.patch b/package/libnetfilter_conntrack/libnetfilter_conntrack-01-uclinux.patch
similarity index 100%
rename from package/libnetfilter_conntrack/libnetfilter-conntrack-01-uclinux.patch
rename to package/libnetfilter_conntrack/libnetfilter_conntrack-01-uclinux.patch
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
similarity index 100%
rename from package/libnetfilter_conntrack/libnetfilter-conntrack.mk
rename to package/libnetfilter_conntrack/libnetfilter_conntrack.mk
diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper-01-uclinux.patch b/package/libnetfilter_cthelper/libnetfilter_cthelper-01-uclinux.patch
similarity index 100%
rename from package/libnetfilter_cthelper/libnetfilter-cthelper-01-uclinux.patch
rename to package/libnetfilter_cthelper/libnetfilter_cthelper-01-uclinux.patch
diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
similarity index 100%
rename from package/libnetfilter_cthelper/libnetfilter-cthelper.mk
rename to package/libnetfilter_cthelper/libnetfilter_cthelper.mk
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout-01-uclinux.patch b/package/libnetfilter_cttimeout/libnetfilter_cttimeout-01-uclinux.patch
similarity index 100%
rename from package/libnetfilter_cttimeout/libnetfilter-cttimeout-01-uclinux.patch
rename to package/libnetfilter_cttimeout/libnetfilter_cttimeout-01-uclinux.patch
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
similarity index 100%
rename from package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
rename to package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
diff --git a/package/libnetfilter_log/libnetfilter-log-01-uclinux.patch b/package/libnetfilter_log/libnetfilter_log-01-uclinux.patch
similarity index 100%
rename from package/libnetfilter_log/libnetfilter-log-01-uclinux.patch
rename to package/libnetfilter_log/libnetfilter_log-01-uclinux.patch
diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter_log.mk
similarity index 100%
rename from package/libnetfilter_log/libnetfilter-log.mk
rename to package/libnetfilter_log/libnetfilter_log.mk
diff --git a/package/libnetfilter_queue/libnetfilter-queue-01-uclinux.patch b/package/libnetfilter_queue/libnetfilter_queue-01-uclinux.patch
similarity index 100%
rename from package/libnetfilter_queue/libnetfilter-queue-01-uclinux.patch
rename to package/libnetfilter_queue/libnetfilter_queue-01-uclinux.patch
diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter_queue.mk
similarity index 100%
rename from package/libnetfilter_queue/libnetfilter-queue.mk
rename to package/libnetfilter_queue/libnetfilter_queue.mk
