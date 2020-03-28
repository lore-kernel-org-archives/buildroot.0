From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Mar 2020 08:56:21 +0000
Subject: [Buildroot] [Bug 12711] host-localedef 2.30-20 fails to compile on
 fedora 32 (gcc 10.0.1)
In-Reply-To: <bug-12711-163@https.bugs.busybox.net/>
References: <bug-12711-163@https.bugs.busybox.net/>
Message-ID: <bug-12711-163-qtcI4t3Y7y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12711

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Ian, All,

You may want to backport this upstream commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=1471fa556afb428c4a4c46cf5543a4101d5bcf91

Care to test on your side, and then send us a patch?

Regards,
Yann E, MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
