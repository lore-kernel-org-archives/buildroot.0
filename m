From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Sep 2016 23:17:37 +0200
Subject: [Buildroot] [PATCH] docs/manual: no warranty on output of legal-info
Message-ID: <1475270257-27153-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly state that there is no warranty about the accuracy of the
content of the output of 'make legal-info'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/legal-notice.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 7c19bc3..ac291c8 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -73,6 +73,16 @@ distribution is required).
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
+Finally, keep in mind that the output of +make legal-info+ is based on
+declarative statements in each of the packages recipes. The Buildroot
+developpers try to do their best at keeping those declarative statements
+as accurate as possible, to the best of their knowledge. However, it is
+very well possible that those declarative statements may not all be fully
+accurate nor exhaustive. You (or your legal department) _have_ to check
+the output of +make legal-info+ before using it as your own compliance
+delivery. See the _NO WARRANTY_ clauses (clauses 11 and 12) in the
++COPYING+ file at the root of the Buildroot distribution.
+
 [[legal-info-list-licenses]]
 === License abbreviations
 
-- 
2.7.4
