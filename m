From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 14:46:33 +0200
Subject: [Buildroot] [git commit] docs/manual: use bugs.buildroot.org for
	bugtracker
Message-ID: <20150914125247.6BDE98166B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=162b30bcc37e34a7d107148c520c67e7fec9682d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a bugs.buildroot.org CNAME for bugzilla lets use that in
the manual as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt |    2 +-
 docs/manual/resources.txt  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 40579f9..4d7a833 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -25,7 +25,7 @@ for more information on obtaining a Buildroot git tree.
 === Reproducing, analyzing and fixing bugs
 
 A first way of contributing is to have a look at the open bug reports in
-the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot bug
+the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot bug
 tracker]. As we strive to keep the bug count as small as possible, all
 help in reproducing, analyzing and fixing reported bugs is more than
 welcome. Don't hesitate to add a comment to bug reports reporting your
diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index b327f9e..d2d815e 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -42,7 +42,7 @@ better as it will reach more people, both developers and users.
 Bug tracker::
 +
 Bugs in Buildroot can be reported via the mailing list or alternatively
-via the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot
+via the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot
 bugtracker]. Please refer to xref:reporting-bugs[] before creating a bug
 report.
 
