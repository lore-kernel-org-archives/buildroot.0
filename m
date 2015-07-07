From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jul 2015 15:51:40 +0000 (UTC)
Subject: [Buildroot] [Bug 8191] Request update support for the cubieboard
	series
In-Reply-To: <bug-8191-163@https.bugs.busybox.net/>
References: <bug-8191-163@https.bugs.busybox.net/>
Message-ID: <20150707155140.2E61680196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8191

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-07 15:51:40 UTC ---
Thanks for this contribution. Could you however follow the Buildroot process to
submit patches, by sending them to the mailing list? See
http://buildroot.org/downloads/manual/manual.html#submitting-patches.

Also, in your patch, I think you should make the kernel configurations a bit
more minimal. Enabling these hundreds of drivers as modules is not very useful.
Or better, use a defconfig available in the kernel tree, if any, so that the
kernel configuration file can be removed from the Buildroot tree.

I'll mark the bug as WONTFIX because it's not really a bug per-se, but we're
definitely waiting for your patch on the mailing list to improve the Cubieboard
support!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
