From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 4 Sep 2014 12:18:45 +0100
Subject: [Buildroot] [PATCH 1/2] setserial: Rename patches to add sequence
	numbers
Message-ID: <1409829526-49853-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 ...patch => setserial-0001-build-system-fix.patch} |    0
 ...> setserial-0002-tiocghayesesp-build-fix.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/setserial/{setserial-2.17-build-system-fix.patch => setserial-0001-build-system-fix.patch} (100%)
 rename package/setserial/{setserial-2.17-tiocghayesesp-build-fix.patch => setserial-0002-tiocghayesesp-build-fix.patch} (100%)

diff --git a/package/setserial/setserial-2.17-build-system-fix.patch b/package/setserial/setserial-0001-build-system-fix.patch
similarity index 100%
rename from package/setserial/setserial-2.17-build-system-fix.patch
rename to package/setserial/setserial-0001-build-system-fix.patch
diff --git a/package/setserial/setserial-2.17-tiocghayesesp-build-fix.patch b/package/setserial/setserial-0002-tiocghayesesp-build-fix.patch
similarity index 100%
rename from package/setserial/setserial-2.17-tiocghayesesp-build-fix.patch
rename to package/setserial/setserial-0002-tiocghayesesp-build-fix.patch
-- 
1.7.1
