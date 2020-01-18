From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jan 2020 22:22:38 +0000
Subject: [Buildroot] [Bug 12481] minicom fails when output directory path
 contains "m4"
In-Reply-To: <bug-12481-163@https.bugs.busybox.net/>
References: <bug-12481-163@https.bugs.busybox.net/>
Message-ID: <bug-12481-163-3OOpw4N3Mo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #9 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Fixed with:
https://git.buildroot.org/buildroot/commit/?id=41b9a64526b7bbd28ba2d084f3786cb536750daa

Thanks both for the report, investigation and fix! :-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
