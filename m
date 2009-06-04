From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2009 19:21:05 +0000 (UTC)
Subject: [Buildroot] [Bug 373] Support for building gstreamer without libxml
In-Reply-To: <bug-373-163@https.bugs.busybox.net/>
References: <bug-373-163@https.bugs.busybox.net/>
Message-ID: <20090604192106.0E80977829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=373





--- Comment #4 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-04 19:21:05 UTC ---
In the gst-plugins-good package there is a plugin called "annodex (XML
Library)". I guess it should now select BR2_PACKAGE_GSTREAMER_XML instead of
BR2_PACKAGE_LIBXML2 (or both?).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
