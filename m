From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 16 Mar 2017 17:24:00 +0530
Subject: [Buildroot] [PATCH 2/3] docs/manual: document MPL licenses
In-Reply-To: <1489665241-14942-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489665241-14942-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1489665241-14942-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages are provided under MPL v1.1 and v2.0. Document it under
License abbreviations section.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Note: There appears to be Mozilla Public License Version 1.0 as well. But I can't
find link to web page on mozilla.org site. So it is not documented currently.

 docs/manual/legal-notice.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 1e1e2b3..df82fd2 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -151,6 +151,12 @@ Buildroot, with the name used in the manifest files:
 * `ISC`:
   https://opensource.org/licenses/ISC[
   ISC License];
+* `MPLv1.1`:
+  https://www.mozilla.org/en-US/MPL/1.1[
+  Mozilla Public License Version 1.1]
+* `MPLv2.0`:
+  https://www.mozilla.org/en-US/MPL/2.0[
+  Mozilla Public License Version 2.0]
 
 [[legal-info-buildroot]]
 === Complying with the Buildroot license
-- 
2.6.2
