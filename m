From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2013 21:05:33 +0100
Subject: [Buildroot] [git commit] docs: add a page to thank our sponsors
Message-ID: <20131113201143.329319BC4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4de330fa2d6d1428a164a11dbe62e08200312022
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Offer a little bit more visibility to the companies who sponsored us,
either by sponsoring the developer days, or development
boards. Hopefully this will encourage other companies to do the same :)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/header.html   |    1 +
 docs/sponsors.html |   41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index 9c615f4..b987d85 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -56,6 +56,7 @@
     <br><a href="/lists.html">Mailing Lists</a>
     <br><a href="http://autobuild.buildroot.org">Autobuilder</a>
     <br><a href="http://patchwork.buildroot.org">Patchwork</a>
+    <br><a href="/sponsors.html">Sponsors</a>
 
 </td>
 
diff --git a/docs/sponsors.html b/docs/sponsors.html
new file mode 100644
index 0000000..a048b1d
--- /dev/null
+++ b/docs/sponsors.html
@@ -0,0 +1,41 @@
+<!--#include file="header.html" -->
+
+<h3>Sponsors</h3>
+
+<p>Throughout its history, the Buildroot project has been sponsored by
+various companies, that we would like to thank below:</p>
+
+<ul>
+
+  <li><a href="http://www.google.com">Google</a>, for providing all
+  the logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
+  Brussels, Belgium.</li>
+
+  <li><a href="http://www.imgtec.com/">Imagination Technologies</a>,
+  for sponsoring the meeting room and dinner of the ELCE 2013
+  Developer Days in Edinburgh, UK.</li>
+
+  <li><a href="http://circuitco.com/">CircuitCo</a>, for sponsoring
+  several development boards for the Google Summer of Code 2013
+  project on Buildroot.</li>
+
+  <li><a href="http://boundarydevices.com/">BoundaryDevices</a>, for
+  sponsoring an i.MX6 development board for the Google Summer of Code
+  2013 project on Buildroot.</li>
+
+  <li><a href="http://www.fluendo.com/">Fluendo</a>, for sponsoring
+  the meeting room for the ELCE 2012 Developer Days in Barcelona
+  Spain.</li>
+
+  <li><a href="http://www.synopsys.com">Synopsys</a>, for sponsoring
+  the dinner for the ELCE 2012 Developer Days in Barcelona,
+  Spain.</li>
+
+  <li><a href="http://www.calao-systems.com/">Calao Systems</a>
+  and <a href="http://free-electrons.com/">Free Electrons</a> for
+  providing a meeting room and offering lunch for the ELCE 2009
+  Developer Days in Grenoble, France.</li>
+
+</ul>
+
+<!--#include file="footer.html" -->
