From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 19:45:21 +0000 (UTC)
Subject: [Buildroot] [Bug 563] compiling Linux 2.30.2 for ARM with Atmel
	support
In-Reply-To: <bug-563-163@https.bugs.busybox.net/>
References: <bug-563-163@https.bugs.busybox.net/>
Message-ID: <20090811194521.55FCC776A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=563


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc.|ulf.samuelsson at atmel.com
                   |org                         |




--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-08-11 19:45:20 UTC ---
I'm not sure how to handle this bug. For sure, a patch designed to be applied
on a particular kernel version will only apply on this particular version. And
it seems that in Buildroot, Atmel patches are only available up to 2.6.28.
Which means that newer kernels have not been integrated yet. What behaviour
would you expect from Buildroot here ?

I'm assigning the bug to Ulf Samuelsson, who usually handle Atmel-specific
issues in Buildroot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
