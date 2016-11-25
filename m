From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Nov 2016 20:45:23 +0000
Subject: [Buildroot] [Bug 9446] make raspberrypi3_defconfig compilation
	failure
In-Reply-To: <bug-9446-163@https.bugs.busybox.net/>
References: <bug-9446-163@https.bugs.busybox.net/>
Message-ID: <bug-9446-163-sEm28SR72U@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9446

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report.

This is a bug in your host compiler, i.e the one that comes from your
distribution. There is nothing Buildroot can do about it: talk with your
distribution provider, and tell them that the compiler they provide segfaults
when building gmp.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
