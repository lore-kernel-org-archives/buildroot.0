From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Aug 2009 08:39:14 +0000 (UTC)
Subject: [Buildroot] [Bug 553] Wrong DirectFB ps2mouse limitation
In-Reply-To: <bug-553-163@https.bugs.busybox.net/>
References: <bug-553-163@https.bugs.busybox.net/>
Message-ID: <20090810083914.E6224777B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=553





--- Comment #4 from Sven Neumann <s.neumann@raumfeld.com>  2009-08-10 08:39:14 UTC ---
Using a USB mouse with the linux_input driver works for me. Of course you need
to have support for USB input devices enabled (CONFIG_USB_HID). But anyway, if
the psmouse driver in DirectFB works on non-i386 platforms, then I see no
reason not to allow users of buildroot to enable it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
