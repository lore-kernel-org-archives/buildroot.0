From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jul 2010 07:19:47 +0000 (UTC)
Subject: [Buildroot] [Bug 2251] directory output/build after make
	*_defconfig not found
In-Reply-To: <bug-2251-163@https.bugs.busybox.net/>
References: <bug-2251-163@https.bugs.busybox.net/>
Message-ID: <20100720071947.871DC82B68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2251

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
I believe this was fixed by c9ff3273eb94:

commit c9ff3273eb94078ad342d0a3e08e1757bced2afa
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Tue Jul 20 08:45:45 2010 +0200

    linux: linux26-{menu,x,g}config needs host-sed

    Similar to how it's done for uclibc-menuconfig.

    Reported-by: Paul Jones <paul@pauljones.id.au>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

It works here atleast. If not, please reopen the bug report with more info.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
