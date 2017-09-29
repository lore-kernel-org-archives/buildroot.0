From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Sep 2017 09:14:19 +0000
Subject: [Buildroot] [Bug 10351] glibc missing in rootfs
In-Reply-To: <bug-10351-163@https.bugs.busybox.net/>
References: <bug-10351-163@https.bugs.busybox.net/>
Message-ID: <bug-10351-163-x7aO5ZvwGI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10351

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Alex,

I can't reproduce here, the C library is correctly installed in target/
and present in both images.

In case you changed the toolchain configuration after a previous build,
be sure to start from scratch:  make clean; make

(see the manual:
http://buildroot.net/downloads/manual/manual.html#_full_rebuild)

If you still have the issue, then please re-open.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
