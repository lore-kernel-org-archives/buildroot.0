From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 May 2018 20:51:48 +0000
Subject: [Buildroot] [Bug 11031] ld-elf2flt: host/bin/ld.real': execvp: No
 such file or directory
In-Reply-To: <bug-11031-163@https.bugs.busybox.net/>
References: <bug-11031-163@https.bugs.busybox.net/>
Message-ID: <bug-11031-163-9tM9ZiPUmm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11031

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|thomas.petazzoni at free-elect |yann.morin.1998 at free.fr
                   |rons.com                    |

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello Chritophe,

I've sent two patches to try and fix this issue:
    https://patchwork.ozlabs.org/patch/920759/
    https://patchwork.ozlabs.org/patch/920760/

I only tried to build stm32f469_disco_defconfig with them, and it
was OK. I can't test-run by lack of hardware, though, so it would
be nice if you could confirm they indeed fix the issue.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
