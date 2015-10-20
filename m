From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Oct 2015 15:05:53 +0100
Subject: [Buildroot] [PATCH 2/3] dhcpdump: add project URL
In-Reply-To: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1445349954-44062-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dhcpdump/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index 1840e34..2368a46 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -3,3 +3,5 @@ config BR2_PACKAGE_DHCPDUMP
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
+
+	  http://www.mavetju.org/
-- 
1.7.1
