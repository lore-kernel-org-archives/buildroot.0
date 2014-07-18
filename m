From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 17 Jul 2014 23:56:53 -0400
Subject: [Buildroot] [PATCH 1/2] ntp: rename patches to follow BR guidelines
Message-ID: <1405655815-2025-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 .../{ntp-adjtimex.patch => ntp-001-adjtimex.patch} |    0
 package/ntp/{ntp-nano.patch => ntp-002-nano.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/ntp/{ntp-adjtimex.patch => ntp-001-adjtimex.patch} (100%)
 rename package/ntp/{ntp-nano.patch => ntp-002-nano.patch} (100%)

diff --git a/package/ntp/ntp-adjtimex.patch b/package/ntp/ntp-001-adjtimex.patch
similarity index 100%
rename from package/ntp/ntp-adjtimex.patch
rename to package/ntp/ntp-001-adjtimex.patch
diff --git a/package/ntp/ntp-nano.patch b/package/ntp/ntp-002-nano.patch
similarity index 100%
rename from package/ntp/ntp-nano.patch
rename to package/ntp/ntp-002-nano.patch
-- 
1.7.9.5
