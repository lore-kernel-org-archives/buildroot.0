From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:04:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6500] php fails to build for armel.
In-Reply-To: <bug-6500-163@https.bugs.busybox.net/>
References: <bug-6500-163@https.bugs.busybox.net/>
Message-ID: <20131114000438.249F39BC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6500

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:04:37 UTC ---
Now that I look at this, it seems similar to an autobuilder failure that we
have seen, where the iconv module gets built with -I"/usr/include" in the
compiler flags.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
