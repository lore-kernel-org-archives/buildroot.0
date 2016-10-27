From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 20:30:00 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-DGu9sjR2ro@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Andrey,

Thanks for your report.

I've tried to run atmel_sama5d4_xplained_defconfig that uses ubinize,
but was not able to reproduce your issue.

Note that we already had a very similar issue a while back, but it was
marked as "worksforme" and closed because we had no precise explanations
on how to reproduce:
    https://bugs.busybox.net/show_bug.cgi?id=9096

Since you have that issue now, would you care to provide a defconfig
file that exhibits the problem, so we can try to reproduce and
invetigate further, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
