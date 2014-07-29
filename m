From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:11:47 +0200
Subject: [Buildroot] [PATCH 1/2] popt: rename patch to use the correct
	naming convention
Message-ID: <1406657508-16244-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch renames the popt patch popt-1.14_no-wchar.patch to
popt-01-no-wchar.patch in order to follow the naming convention used
in all packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/{popt-1.14_no-wchar.patch => popt-01-no-wchar.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/popt/{popt-1.14_no-wchar.patch => popt-01-no-wchar.patch} (100%)

diff --git a/package/popt/popt-1.14_no-wchar.patch b/package/popt/popt-01-no-wchar.patch
similarity index 100%
rename from package/popt/popt-1.14_no-wchar.patch
rename to package/popt/popt-01-no-wchar.patch
-- 
2.0.0
