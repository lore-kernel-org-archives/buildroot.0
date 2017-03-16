From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Mar 2017 16:58:04 +0100
Subject: [Buildroot] [git commit] docs/manual: document MPL licenses
Message-ID: <20170316155909.79BAC82489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0b2cd662b68b8f2e8f3adfce5d00d12cb08615d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many packages are provided under MPL v1.1 and v2.0. Document it under
License abbreviations section.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
