From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Oct 2016 17:26:32 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: no warranty on output of
	legal-info
Message-ID: <1475335592-15482-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly state that there is no warranty about the accuracy of the
content of the output of 'make legal-info'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
  - reword  (Arnout, Luca)
  - carry the ACKs from Arnout and Luca since I did exactly what they
    suggested and they both agreed to each other's reviews.
---
 docs/manual/legal-notice.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 7c19bc3..c9b5211 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -73,6 +73,16 @@ distribution is required).
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
+Finally, keep in mind that the output of +make legal-info+ is based on
+declarative statements in each of the packages recipes. The Buildroot
+developers try to do their best to keep those declarative statements as
+accurate as possible, to the best of their knowledge. However, it is very
+well possible that those declarative statements are not all fully accurate
+nor exhaustive. You (or your legal department) _have_ to check the output
+of +make legal-info+ before using it as your own compliance delivery. See
+the _NO WARRANTY_ clauses (clauses 11 and 12) in the +COPYING+ file at the
+root of the Buildroot distribution.
+
 [[legal-info-list-licenses]]
 === License abbreviations
 
-- 
2.7.4
