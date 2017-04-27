From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 21:37:50 +0200
Subject: [Buildroot] [git commit] docs/manual: PEP8 coding style for Python
	scripts
Message-ID: <20170427200446.DE2A0802E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb1c63763d862419e22f30b90fcd5179d40a0c5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The advantages of using a pre-existing coding style instead of creating
our own are:
- documenting on the manual takes a single sentence;
- there are automatic tools to help during development/review.

So document that PEP8 recommendation should be followed.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/writing-rules.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index e2ad41e..3a2c8dc 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -143,3 +143,8 @@ http://www.methods.co.nz/asciidoc/[asciidoc] format.
 
 For further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
 syntax, refer to http://www.methods.co.nz/asciidoc/userguide.html[].
+
+=== Support scripts
+
+Some scripts in the +support/+ directory are written in Python and should follow
+the https://www.python.org/dev/peps/pep-0008/[PEP8 Style Guide for Python Code].
