From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 May 2018 20:42:45 +0000
Subject: [Buildroot] [Bug 10986] Installing package attr when already
 supplied by busybox replaces busybox. Resulting in confusing boot/init
 error.
In-Reply-To: <bug-10986-163@https.bugs.busybox.net/>
References: <bug-10986-163@https.bugs.busybox.net/>
Message-ID: <bug-10986-163-7jIi8ZzghK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10986

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |ASSIGNED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

Thanks for the report.

I've sent a tentative patch too fix this issue quickly:
https://patchwork.ozlabs.org/patch/909026/

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
