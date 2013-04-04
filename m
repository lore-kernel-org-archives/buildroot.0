From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Apr 2013 06:51:53 +0000 (UTC)
Subject: [Buildroot] [Bug 4538] main() not exited normally then using
	pthreads
In-Reply-To: <bug-4538-163@https.bugs.busybox.net/>
References: <bug-4538-163@https.bugs.busybox.net/>
Message-ID: <20130404065153.F36929B4B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4538

Michael J. Wang <mjwang@broadcom.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mjwang at broadcom.com,
                   |                            |uclibc-cvs at uclibc.org
          Component|Other                       |Threads
            Version|2011.08                     |0.9.32
         AssignedTo|unassigned at buildroot.uclibc |unassigned at uclibc.org
                   |.org                        |
            Product|buildroot                   |uClibc
   Target Milestone|---                         |0.9.33.2

--- Comment #7 from Michael J. Wang <mjwang@broadcom.com> 2013-04-04 06:52:37 UTC ---
(In reply to comment #6)

Oh, I now see that "product" is set to "BuildRoot" instead of "uClibc".  
Fixing it now and see if that will get the attention of the uClibc developers.

Michael

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
