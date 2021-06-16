From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Jun 2021 20:14:34 +0000
Subject: [Buildroot] [Bug 13836] package build failure when target install
 set to no on pkg-generic pkg types
In-Reply-To: <bug-13836-163@https.bugs.busybox.net/>
References: <bug-13836-163@https.bugs.busybox.net/>
Message-ID: <bug-13836-163-BkytoVrKig@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13836

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Matt, All,

Thanks for the report.

We believe this is now fixed with commit ee5e14ff17fd (core/pkg-generic: fix
instrumentation for packages that install nowhere) that was just pushed.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
