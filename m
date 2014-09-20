From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 20 Sep 2014 20:34:35 +0200
Subject: [Buildroot] [PATCH 2/2] docs: improve look of sponsors page
In-Reply-To: <1411218824-31293-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1411218824-31293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1411218824-31293-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <90aa39ca-ed61-45a0-af6f-3e39acd0263a@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>This commit completely reworks the Sponsors page, to improve its look,
>put the current sponsor in a clearly visible way, and add the logo of
>all sponsors.
>
>Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>---
> docs/css/buildroot.css                |  23 +++++
> docs/images/boundary-devices-logo.png | Bin 0 -> 13305 bytes
> docs/images/calao-logo.png            | Bin 0 -> 15386 bytes
> docs/images/circuitco-logo.png        | Bin 0 -> 10750 bytes
> docs/images/fluendo-logo.png          | Bin 0 -> 9098 bytes
> docs/images/free-electrons-logo.png   | Bin 0 -> 9968 bytes
> docs/images/google-logo.png           | Bin 0 -> 12005 bytes
> docs/images/imgtec-logo.png           | Bin 0 -> 5276 bytes
> docs/images/mind-logo.png             | Bin 0 -> 10214 bytes
> docs/images/synopsys-logo.png         | Bin 0 -> 52426 bytes
> docs/sponsors.html                    | 169 +++++++++++++++++++++++++++-------
> 11 files changed, 157 insertions(+), 35 deletions(-)
> create mode 100644 docs/images/boundary-devices-logo.png
> create mode 100644 docs/images/calao-logo.png
> create mode 100644 docs/images/circuitco-logo.png
> create mode 100644 docs/images/fluendo-logo.png
> create mode 100644 docs/images/free-electrons-logo.png
> create mode 100644 docs/images/google-logo.png
> create mode 100644 docs/images/imgtec-logo.png
> create mode 100644 docs/images/mind-logo.png
> create mode 100644 docs/images/synopsys-logo.png

>diff --git a/docs/sponsors.html b/docs/sponsors.html
>index 321dad7..7ab5bd6 100644
>--- a/docs/sponsors.html
>+++ b/docs/sponsors.html
>@@ -2,46 +2,145 @@
> 
> <h2>Sponsors</h2>
> 
>-<p>Throughout its history, the Buildroot project has been sponsored by
>-various companies, that we would like to thank below:</p>
>-
>-<ul>
>-
>-  <li><a href="http://www.mind.be">Mind</a>, for sponsoring the dinner
>-  of the FOSDEM 2014 Developers meeting in Brussels, Belgium. Mind
>-  (www.mind.be) is the Embedded Software division of Essensium, which
>-  provides consultancy and services specifically in the field of Linux
>-  and Open Source SW for Embedded Systems.</li>
>+<h3>Current sponsors</h3>
> 
>-  <li><a href="http://www.google.com">Google</a>, for providing all
>-  the logistics for the FOSDEM 2013 and FOSDEM 2014 Developer Days in
>-  Brussels, Belgium.</li>
>+<div class="container">
>+  <div class="row-fluid">
>+    <div class="span12 sponsor-main">
>+      <div class="row-fluid">
>+	<div class="span4">
>+	  <a href="http://mind.be">
>+	    <img src="images/mind-logo.png"/>
>+	  </a>
>+	</div>
>+	<div class="span8">
>+	  <p><a href="http://www.mind.be">Mind</a> is the Embedded
>+	  Software division of Essensium, which provides consultancy
>+	  and services specifically in the field of Linux and Open
>+	    Source SW for Embedded Systems.</p>
> 
>-  <li><a href="http://www.imgtec.com/">Imagination Technologies</a>,
>-  for sponsoring the meeting room and dinner of the ELCE 2013
>-  Developer Days in Edinburgh, UK.</li>
>+	  <p>Mind is sponsoring
>+	  the <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">Buildroot
>+	  Developers Meeting</a> colocated with the Embedded Linux
>+	  Conference Europe, taking place on October 10-11 2014 in

The meeting itself is 11-12.

In general, very nice improvement!

Best regards,
Thomas
