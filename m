From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Jan 2021 22:33:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/xerces: renumber patch
Message-ID: <20210118213300.662442-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7f115d2de4276972098b8f4cfeb0150c8e851d89 forgot to renumber the
remaining patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ng-with-curl.patch => 0001-fix-static-linking-with-curl.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/xerces/{0002-fix-static-linking-with-curl.patch => 0001-fix-static-linking-with-curl.patch} (100%)

diff --git a/package/xerces/0002-fix-static-linking-with-curl.patch b/package/xerces/0001-fix-static-linking-with-curl.patch
similarity index 100%
rename from package/xerces/0002-fix-static-linking-with-curl.patch
rename to package/xerces/0001-fix-static-linking-with-curl.patch
-- 
2.29.2
