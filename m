From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 12:23:43 +0000 (UTC)
Subject: [Buildroot] [Bug 8266] mplayer build issue
In-Reply-To: <bug-8266-163@https.bugs.busybox.net/>
References: <bug-8266-163@https.bugs.busybox.net/>
Message-ID: <20151014122343.2FA4781776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8266

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-14 12:23:42 UTC ---
Your defconfig (with just the post-build script, overlay, custom Busybox
config, and the custom cflags removed) builds fine with the current Buildroot
master. So I believe that the bug has been fixed (maybe due to the fact that
the gcc version has been upgraded).

I'll therefore close the bug. However, if you still see the issue, do not
hesitate to re-open it. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
