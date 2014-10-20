From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Oct 2014 21:06:14 +0000 (UTC)
Subject: [Buildroot] [Bug 7088] elfutils on Blackfin doesn't build
In-Reply-To: <bug-7088-163@https.bugs.busybox.net/>
References: <bug-7088-163@https.bugs.busybox.net/>
Message-ID: <20141020210614.5ABFCAF583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7088

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-20 21:06:14 UTC ---
Agreed, if there's no support for Blackfin, then let's drop this bug. Since
there is a list of architectures supported by elfutils, it would be good to use
this list for the dependencies of the elfutils package, rather than just the
two exclusions we have today (avr32 and blackfin).

But that's a separate matter, so I'll close this bug as wontfix.

Thanks for the feedback Mike!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
