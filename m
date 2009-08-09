From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Aug 2009 10:48:20 +0000 (UTC)
Subject: [Buildroot] [Bug 553] Wrong DirectFB ps2mouse limitation
In-Reply-To: <bug-553-163@https.bugs.busybox.net/>
References: <bug-553-163@https.bugs.busybox.net/>
Message-ID: <20090809104820.E40B3777CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=553





--- Comment #3 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-08-09 10:48:20 UTC ---
(In reply to comment #2)
> That's probably correct. But wouldn't you better use the linux_input driver for
> an USB mouse?
> 

I first thought that I needed the linux_input driver, and configured DirectFB
with linux_input support but without ps2mouse support. And the mouse I
connected to my board wasn't detected. So I tried the ps2mouse driver and it
worked.

Maybe I missconfigured something in the kernel... I don't know.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
