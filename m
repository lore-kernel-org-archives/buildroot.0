From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 May 2021 19:26:13 +0000
Subject: [Buildroot] [Bug 13751] libopenssl (static): huge drop in
 performance in newer versions of buildroot
In-Reply-To: <bug-13751-163@https.bugs.busybox.net/>
References: <bug-13751-163@https.bugs.busybox.net/>
Message-ID: <bug-13751-163-RxOAbkyQFP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13751

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |RESOLVED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello, 

Thanks for your report. We believe this has now been fixed with commit
67d19f6014 (package/libopenssl: fix performance issue in static build)
as provided by Fabrice.

Thanks!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
