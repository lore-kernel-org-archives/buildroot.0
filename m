From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Tue, 15 Oct 2013 17:37:20 +0200
Subject: [Buildroot] [PATCH 1/1] libnet-* rename .mk files according to
	package name
Message-ID: <1381851440-23347-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
According to the documentation, .mk name should be the same as package folder name.
---
 ...netfilter-acct-01-uclinux.patch => libnetfilter_acct-01-uclinux.patch} | 0
 package/libnetfilter_acct/{libnetfilter-acct.mk => libnetfilter_acct.mk}  | 0
 ...conntrack-01-uclinux.patch => libnetfilter_conntrack-01-uclinux.patch} | 0
 .../{libnetfilter-conntrack.mk => libnetfilter_conntrack.mk}              | 0
 ...r-cthelper-01-uclinux.patch => libnetfilter_cthelper-01-uclinux.patch} | 0
 .../{libnetfilter-cthelper.mk => libnetfilter_cthelper.mk}                | 0
 ...cttimeout-01-uclinux.patch => libnetfilter_cttimeout-01-uclinux.patch} | 0
 .../{libnetfilter-cttimeout.mk => libnetfilter_cttimeout.mk}              | 0
 ...ibnetfilter-log-01-uclinux.patch => libnetfilter_log-01-uclinux.patch} | 0
 package/libnetfilter_log/{libnetfilter-log.mk => libnetfilter_log.mk}     | 0
 ...tfilter-queue-01-uclinux.patch => libnetfilter_queue-01-uclinux.patch} | 0
 .../libnetfilter_queue/{libnetfilter-queue.mk => libnetfilter_queue.mk}   | 0
 12 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libnetfilter_acct/{libnetfilter-acct-01-uclinux.patch => libnetfilter_acct-01-uclinux.patch} (100%)
 rename package/libnetfilter_acct/{libnetfilter-acct.mk => libnetfilter_acct.mk} (100%)
 rename package/libnetfilter_conntrack/{libnetfilter-conntrack-01-uclinux.patch => libnetfilter_conntrack-01-uclinux.patch} (100%)
 rename package/libnetfilter_conntrack/{libnetfilter-conntrack.mk => libnetfilter_conntrack.mk} (100%)
 rename package/libnetfilter_cthelper/{libnetfilter-cthelper-01-uclinux.patch => libnetfilter_cthelper-01-uclinux.patch} (100%)
 rename package/libnetfilter_cthelper/{libnetfilter-cthelper.mk => libnetfilter_cthelper.mk} (100%)
 rename package/libnetfilter_cttimeout/{libnetfilter-cttimeout-01-uclinux.patch => libnetfilter_cttimeout-01-uclinux.patch} (100%)
 rename package/libnetfilter_cttimeout/{libnetfilter-cttimeout.mk => libnetfilter_cttimeout.mk} (100%)
 rename package/libnetfilter_log/{libnetfilter-log-01-uclinux.patch => libnetfilter_log-01-uclinux.patch} (100%)
 rename package/libnetfilter_log/{libnetfilter-log.mk => libnetfilter_log.mk} (100%)
 rename package/libnetfilter_queue/{libnetfilter-queue-01-uclinux.patch => libnetfilter_queue-01-uclinux.patch} (100%)
 rename package/libnetfilter_queue/{libnetfilter-queue.mk => libnetfilter_queue.mk} (100%)

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
-- 
1.8.3.1
