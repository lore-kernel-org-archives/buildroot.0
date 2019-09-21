From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:59:42 +0200
Subject: [Buildroot] [git commit] package/rsyslog: add missing hashes for
 COPYING.* files
Message-ID: <20190921135526.256898EE3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d77752b4ed1ab6089896185a232ded9599a18b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rsyslog/rsyslog.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 4fe6a0e261..fb3a552b0b 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,7 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
 sha256	06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca	rsyslog-8.22.0.tar.gz
+
+# Locally calculated
+sha256	054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083	COPYING
+sha256	8743ad560dea1229d4f46cd603e10874db41a27f3c74f64e958ef123f3943fab	COPYING.ASL20
+sha256	4038442ca5bde8ffd243cfc235cb4455e7d618d47558ea3d8284733f71d904ed	COPYING.LESSER
