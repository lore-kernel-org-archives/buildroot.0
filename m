From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 04 Apr 2020 13:26:49 +0000
Subject: [Buildroot] [Bug 12746] "sysdig" package description points to
 http://sysdig.org, which bounces to malware site
In-Reply-To: <bug-12746-163@https.bugs.busybox.net/>
References: <bug-12746-163@https.bugs.busybox.net/>
Message-ID: <bug-12746-163-ZrHKYRHBrM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12746

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |RESOLVED

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thanks for the reportand the patch, fixed with commit ca3166da48.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
