From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 May 2010 11:03:58 +0000 (UTC)
Subject: [Buildroot] [Bug 1855] XORG Keyboard driver fails to compile
In-Reply-To: <bug-1855-163@https.bugs.busybox.net/>
References: <bug-1855-163@https.bugs.busybox.net/>
Message-ID: <20100530110358.819918A522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1855

--- Comment #2 from paul.jones at iwtech.com.au <paul@pauljones.id.au>  ---
(In reply to comment #1)
> 
> What package is this exactly? BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD? That one
> seems to list both xserver and xproto as dependencies.

Yes, that's the one. I built it the other day and it worked ok, but today I did
a "git pull && make distclean" and now it's not working.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
