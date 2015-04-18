From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 18 Apr 2015 18:54:26 +0200
Subject: [Buildroot] [PATCH 2/3] manual: cvs: document that a date can be
	used instead of a tag
In-Reply-To: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1429376067-9228-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also instead of using the generic word "timestamp" use the word "tag".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8cf6bb6..be754a2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -280,7 +280,7 @@ information is (assuming the package name is +libfoo+) :
      Only anonymous pserver mode is supported.
      +LIBFOO_SITE+ 'must' contain the source URL as well as the remote
      repository directory. The module is the package name.
-     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a timestamp.
+     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a tag or a date.
   ** +git+ for retrieving source code from a Git repository. Used by
      default when +LIBFOO_SITE+ begins with +git://+. The downloaded
      source code is cached as with the +svn+
-- 
2.3.5
