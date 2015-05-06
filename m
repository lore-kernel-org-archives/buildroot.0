From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  6 May 2015 14:17:49 +0200
Subject: [Buildroot] [PATCH v3 2/3] manual: cvs: document that a branch or a
	date can be used
In-Reply-To: <1430914670-14882-1-git-send-email-fabio.porcedda@gmail.com>
References: <1430914670-14882-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1430914670-14882-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also instead of using the generic word "timestamp" use the word "tag".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8cf6bb6..bc07667 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -280,7 +280,9 @@ information is (assuming the package name is +libfoo+) :
      Only anonymous pserver mode is supported.
      +LIBFOO_SITE+ 'must' contain the source URL as well as the remote
      repository directory. The module is the package name.
-     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a timestamp.
+     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a tag, a branch, or
+     a date (e.g. "2014-10-20", "2014-10-20 13:45", "2014-10-20
+     13:45+01" see "man cvs" for further details).
   ** +git+ for retrieving source code from a Git repository. Used by
      default when +LIBFOO_SITE+ begins with +git://+. The downloaded
      source code is cached as with the +svn+
-- 
2.3.5
