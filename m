From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Nov 2009 19:55:41 +0000 (UTC)
Subject: [Buildroot] [Bug 697] When I select libusb component,
 the following error occured. If deselect from menuconfig,
 buildroot make process working properly.
In-Reply-To: <bug-697-163@https.bugs.busybox.net/>
References: <bug-697-163@https.bugs.busybox.net/>
Message-ID: <20091109195541.5CCD47779F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=697


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |DUPLICATE




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-11-09 19:55:40 UTC ---
This seems to be the same issue as in #679. Could you try changing the version
number at the top of package/autoconf/autoconf.mk to 2.63 instead and try
again?

*** This bug has been marked as a duplicate of bug 679 ***


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
