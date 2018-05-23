From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 May 2018 17:49:21 +0000
Subject: [Buildroot] [Bug 11031] ld-elf2flt: host/bin/ld.real': execvp: No
 such file or directory
In-Reply-To: <bug-11031-163@https.bugs.busybox.net/>
References: <bug-11031-163@https.bugs.busybox.net/>
Message-ID: <bug-11031-163-GeNh9dndjh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11031

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |thomas.petazzoni at free-elect
                   |.org                        |rons.com

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello Christophe,

Thanks for the report.

I've bisected this issue to the folowing commit:
    f9cffb6af464c5c049daa93d557e485ea61f14a8 binutils: replace hard-links with
soft-links to fix rpath

I've added Thomas in cc of this bug now, as he already investigating the
reason for the offending commit in the first place.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
