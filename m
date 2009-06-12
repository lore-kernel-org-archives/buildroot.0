From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Jun 2009 19:39:59 +0000 (UTC)
Subject: [Buildroot] [Bug 395] gst-plugins-bad: New package.
In-Reply-To: <bug-395-163@https.bugs.busybox.net/>
References: <bug-395-163@https.bugs.busybox.net/>
Message-ID: <20090612194000.2B71277829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=395





--- Comment #1 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-12 19:39:59 UTC ---
(From update of attachment 395)
>diff -N package/multimedia/gst-plugins-bad/Config.in
>--- /dev/null	1 Jan 1970 00:00:00 -0000
>+++ package/multimedia/gst-plugins-bad/Config.in	12 Jun 2009 10:54:43 -0000
>@@ -0,0 +1,171 @@
>+menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
>+	bool "gst-plugins-bad"
>+	depends on BR2_PACKAGE_GSTREAMER
>+	depends on BR2_PACKAGE_GST_PLUGINS_BASE
>+	help
>+	  A set of plug-ins for GStreamer that may be of poor quality or
>+          missing features.

Whitespace error: spaces instead of a tab.
There also seems to be a spelling/grammar issue.

>+
>+	  http://gstreamer.freedesktop.org/

The same whitespace issue as above.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
