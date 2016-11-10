From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Nov 2016 09:14:57 +0000
Subject: [Buildroot] [Bug 9416] Running on 2016.11-rc1 second make fails
 "makedevs: line 23: Couldnt create node
 /buildroot-2016.11-rc1/output/target/dev/console: File exists"
In-Reply-To: <bug-9416-163@https.bugs.busybox.net/>
References: <bug-9416-163@https.bugs.busybox.net/>
Message-ID: <bug-9416-163-u5kmLKCeCH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9416

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Sven,

Thanks for the report, but this has already been fixed with commit c85cd18
(makedevs: make device node creation idempotent).

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
