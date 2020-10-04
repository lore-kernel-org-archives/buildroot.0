From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2020 13:10:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/mraa: renumber patch
Message-ID: <20201004111029.515430-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit fd5376a39d079cc5aa26d67788a0c32d234f2f96 wrongly named the patch
as 0002-x.patch instead of 0001-x.patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...patch => 0001-include-Declare-gVERSION-global-as-extern.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/mraa/{0002-include-Declare-gVERSION-global-as-extern.patch => 0001-include-Declare-gVERSION-global-as-extern.patch} (100%)

diff --git a/package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
similarity index 100%
rename from package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch
rename to package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
-- 
2.28.0
