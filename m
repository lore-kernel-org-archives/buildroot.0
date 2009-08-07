From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 20:19:28 +0000 (UTC)
Subject: [Buildroot] [Bug 269] iptables fails to compile
In-Reply-To: <bug-269-163@https.bugs.busybox.net/>
References: <bug-269-163@https.bugs.busybox.net/>
Message-ID: <20090807201928.3EFBB777A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=269


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WORKSFORME




--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-08-07 20:19:27 UTC ---
I have a 32 bits Ubuntu, I took your .config and compiled it with the latest
Buildroot Git. And it worked nicely. iptables was generated, including IPv6
support. I haven't tested the resulting binaries, though, but at least, the
build completed.

So I'm marking this bug as WORKSFORME. If you are still having the issue, don't
hesitate to re-open it. Thanks for your contribution!


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
