From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 14:50:01 +0200
Subject: [Buildroot] [git commit] website: remove dead udhcp link
Message-ID: <20130708125942.DD9C89A5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c7fb70a496fa86bdb7bd62f522d0d8dab4d6189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The udhcp.busybox.net site is gone, it's now pointing to bugzilla.
udhcp has been a part of busybox for some time now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/header.html |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index a7160cd..12716d0 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -61,7 +61,6 @@
     <br><a href="http://busybox.net/">BusyBox</a>
     <br><a href="http://uclibc.org/">uClibc.org</a>
     <br><a href="http://cxx.uclibc.org/">uClibc++</a>
-    <br><a href="http://udhcp.busybox.net/">udhcp</a>
     <br><a href="http://www.scratchbox.org/">Scratchbox</a>
     <br><a href="http://openembedded.org/">OpenEmbedded</a>
     <br><a href="http://www.ucdot.org/">uCdot</a>
