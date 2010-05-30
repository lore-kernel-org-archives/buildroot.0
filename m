From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 May 2010 10:49:03 +0000 (UTC)
Subject: [Buildroot] [Bug 1855] XORG Keyboard driver fails to compile
In-Reply-To: <bug-1855-163@https.bugs.busybox.net/>
References: <bug-1855-163@https.bugs.busybox.net/>
Message-ID: <20100530104903.35D2E11F342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1855

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #0)
> checking if RANDR is defined... no
> checking if XINPUT is defined... no
> checking if XKB is defined... no
> checking pkg-config is at least version 0.9.0... yes
> checking for XORG... configure: error: Package requirements (xorg-server >=
> 1.2.99.0 xproto ) were not met:
> 
> No package 'xorg-server' found

What package is this exactly? BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD? That one
seems to list both xserver and xproto as dependencies.

Anyway, I'll try building your .config

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
