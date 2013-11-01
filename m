From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Nov 2013 18:47:26 +0100
Subject: [Buildroot] [PATCH 1/2] libcap: rename existing patch
Message-ID: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap currently has one patch, but it is named using the old naming
strategy, which includes the package version, but not a patch
number. This commit switches this to use the new patch naming
strategy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{libcap-2.22-build-system.patch => libcap-01-build-system.patch}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/libcap/{libcap-2.22-build-system.patch => libcap-01-build-system.patch} (100%)

diff --git a/package/libcap/libcap-2.22-build-system.patch b/package/libcap/libcap-01-build-system.patch
similarity index 100%
rename from package/libcap/libcap-2.22-build-system.patch
rename to package/libcap/libcap-01-build-system.patch
-- 
1.8.1.2
