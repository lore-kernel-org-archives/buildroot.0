From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Oct 2015 14:52:55 +0100
Subject: [Buildroot] [PATCH 3/3] noip: add a hash file
In-Reply-To: <1445349175-41234-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445349175-41234-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1445349175-41234-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/noip/noip.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/noip/noip.hash

diff --git a/package/noip/noip.hash b/package/noip/noip.hash
new file mode 100644
index 0000000..166438d
--- /dev/null
+++ b/package/noip/noip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 82b9bafab96a0c53b21aaef688bf70b3572e26217b5e2072bdb09da3c4a6f593  noip-duc-linux.tar.gz
-- 
1.7.1
