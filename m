From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:12:11 +0200
Subject: [Buildroot] [git commit] docs/manual: document makeusers group-only
	creation
Message-ID: <20141022201338.9A42AB0429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f37bb30da1d6a9553c649c81499ed2b8ce660683
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: slightly reword according to the help text.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/makeusers-syntax.txt |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 5b3f347..ecf3eb0 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -16,7 +16,8 @@ user per line; the fields are:
 Where:
 
 - +username+ is the desired user name (aka login name) for the user.
-  It can not be +root+, and must be unique.
+  It can not be +root+, and must be unique. If set to +-+, then just a
+  group will be created.
 - +uid+ is the desired UID for the user. It must be unique, and not
   +0+. If set to +-1+, then a unique UID will be computed by Buildroot
   in the range [1000...1999]
