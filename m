From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2010 07:42:51 +0000 (UTC)
Subject: [Buildroot] [Bug 1315] Allow use of older external toolchains
 without sysroot support
In-Reply-To: <bug-1315-163@https.bugs.busybox.net/>
References: <bug-1315-163@https.bugs.busybox.net/>
Message-ID: <20100316074251.EF93F776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1315


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc.|thomas.petazzoni at free-
                   |org                         |electrons.com




--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-03-16 07:42:50 UTC ---
Thanks for this patch.

In the past, we tried to handle toolchains not supporting --sysroot, but that
proved to be very difficult with packages such as the Gtk stack or Qt. See for
example the thread at
http://lists.busybox.net/pipermail/buildroot/2008-November/023870.html or
http://lists.busybox.net/pipermail/buildroot/2008-December/024147.html.

Does your patch works when compiling Qt, for example ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
