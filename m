From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 08:20:52 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915082052.8725F819C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> 2015-09-15 08:20:52 UTC ---
(In reply to comment #2)
> > Can you please provide more info about your config and what goes wrong?
> 
> The problem is that there is no shutdown in /sbin, shutdown is in /usr/sbin. I
> had to create a link in /sbin to /usr/sbin/shutdown.

Ok, what package do you have providing /usr/sbin/shutdown? I see that busybox
doesn't provide a shutdown applet at all (it does provide halt/poweroff/reboot
though).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
