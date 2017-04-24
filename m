From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 23 Apr 2017 22:33:56 -0300
Subject: [Buildroot] [PATCH] docs/manual: PEP8 coding style for Python
	scripts
Message-ID: <20170424013356.2228-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Here is the sentence I didn't add:
The use of https://pypi.python.org/pypi/pycodestyle[Python style guide checker]
is recommended before submitting new scripts.

I mentioned in a thread the tool pep8/pycodestyle
From https://pypi.python.org/pypi/pycodestyle :
"This package used to be called pep8 but was renamed to pycodestyle to
reduce confusion"
Old url: https://pypi.python.org/pypi/pep8

Also Thomas DS mentioned the tool flake8 that seems to me to group:
pycodestyle + pyflakes + mccabe
http://flake8.pycqa.org/en/latest/
---
 docs/manual/writing-rules.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index e2ad41ebc..3a2c8dcb3 100644
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
-- 
2.11.0
