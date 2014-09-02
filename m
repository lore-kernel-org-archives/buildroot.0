From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  2 Sep 2014 21:01:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/setserial: use numbered patches
Message-ID: <1409684463-7457-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...l-2.17-build-system-fix.patch => setserial-001-build-system-fix.patch} | 0
 ...yesesp-build-fix.patch => setserial-002-tiocghayesesp-build-fix.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/setserial/{setserial-2.17-build-system-fix.patch => setserial-001-build-system-fix.patch} (100%)
 rename package/setserial/{setserial-2.17-tiocghayesesp-build-fix.patch => setserial-002-tiocghayesesp-build-fix.patch} (100%)

diff --git a/package/setserial/setserial-2.17-build-system-fix.patch b/package/setserial/setserial-001-build-system-fix.patch
similarity index 100%
rename from package/setserial/setserial-2.17-build-system-fix.patch
rename to package/setserial/setserial-001-build-system-fix.patch
diff --git a/package/setserial/setserial-2.17-tiocghayesesp-build-fix.patch b/package/setserial/setserial-002-tiocghayesesp-build-fix.patch
similarity index 100%
rename from package/setserial/setserial-2.17-tiocghayesesp-build-fix.patch
rename to package/setserial/setserial-002-tiocghayesesp-build-fix.patch
-- 
1.9.3
