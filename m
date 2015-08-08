From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:35 -0000
Subject: [Buildroot] [git commit branch/next] manual: cvs: document that a
	branch or a date can be used
Message-ID: <20150808105624.5A6FA80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21036a58a20d9aa740a8e7de7352f64779f4d43b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also instead of using the generic word "timestamp" use the word "tag".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
