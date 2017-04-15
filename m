From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 15 Apr 2017 10:44:40 +0530
Subject: [Buildroot] [PATCH] docs/manual: contribute: fix license string for
	Buildroot license
Message-ID: <1492233280-5237-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As per section 12.2 "Complying with the Buildroot license", Buildroot
is released under GPL version 2 or (at your option) any later version.
But SPDX license string for Buildroot license in section 21.5
"Submitting patches" refers to only GPL version 2. Fix this
inconsistency by using correct SPDX identifier.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 docs/manual/contribute.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 4ec01a8..719032b 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -227,7 +227,7 @@ Finally, the patch should be signed off. This is done by adding
 +Signed-off-by: Your Real Name <your@email.address>+ at the end of the
 commit message. +git commit -s+ does that for you, if configured
 properly. The +Signed-off-by+ tag means that you publish the patch
-under the Buildroot license (i.e. GPL-2.0, except for package patches,
+under the Buildroot license (i.e. GPL-2.0+, except for package patches,
 which have the upstream license), and that you are allowed to do so.
 See http://developercertificate.org/[the Developer Certificate of
 Origin] for details.
-- 
2.7.4
