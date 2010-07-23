From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Jul 2010 07:09:11 +0000 (UTC)
Subject: [Buildroot] [Bug 2125] libXfont build fail
In-Reply-To: <bug-2125-163@https.bugs.busybox.net/>
References: <bug-2125-163@https.bugs.busybox.net/>
Message-ID: <20100723070911.AF97683251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2125

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, then let's mark the bug as "works for me", and if anyone manage to
reproduce it somehow, we'll reopen it. I have built xlib_libXfont yesterday in
a clean chroot environment that I use to make sure the Buildroot build doesn't
depend on any particular host tool, and the build went just fine.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
