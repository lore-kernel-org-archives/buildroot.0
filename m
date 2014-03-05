From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Mar 2014 17:24:27 +0100
Subject: [Buildroot] [PATCH 1 of 8] manual: contributing: expand introduction
In-Reply-To: <patchbomb.1394036666@argentina>
References: <patchbomb.1394036666@argentina>
Message-ID: <6f236594e86703960655.1394036667@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch expands the introduction of the "Contributing to buildroot"
section. In general, the intention of this and subsequent patches is to
promote non-feature contributions, like autobuild fixes, bug report
analysis, TODO list work, etc.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/contribute.txt |  31 ++++++++++++++++++++-----------
 1 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -2,26 +2,35 @@
 // vim: set syntax=asciidoc:
 
 Contributing to Buildroot
-========================
+=========================
 
-If you want to contribute to Buildroot, you will need a git view of
-the project. Refer to xref:getting-buildroot[] to get it.
+There are many ways in which you can contribute to Buildroot: analyzing
+and fixing bugs, analyzing and fixing package build failures detected by
+the autobuilders, testing and reviewing patches sent by other
+developers, working on the items in our TODO list and sending your own
+improvements to Buildroot or its manual. The following sections give a
+little more detail on each of these items.
 
-Currently, the mailing list is the central place for contribution.
-If you have not already subscribed to it, then refer to
+If you are interested in contributing to Buildroot, the first thing you
+should do is to subscribe to the Buildroot mailing list. This list is
+the main way of interacting with other Buildroot developers and to send
+contributions to. If you aren't subscribed yet, then refer to
 xref:mailing-list-subscribe[].
 
-Recently, a web interface is also used to manage patches sent to the
-mailing list, see xref:patchwork[].
-
-[NOTE]
-_Please, do not attach patches to bugs, send them to the mailing list
-instead_ (see xref:submitting-patches[]).
+If you are going to touch the code, it is highly recommended to use a
+git repository of Buildroot, rather than starting from an extracted
+source code tarball. Git is the easiest way to develop from and directly
+send your patches to the mailing list. Refer to xref:getting-buildroot[]
+for more information on obtaining a Buildroot git tree.
 
 [[submitting-patches]]
 Submitting patches
 ------------------
 
+[NOTE]
+_Please, do not attach patches to bugs, send them to the mailing list
+instead_.
+
 When your changes are done, and committed in your local git view,
 _rebase_ your development branch on top of the upstream tree before
 generating the patch set. To do so, run:
