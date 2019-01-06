From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Jan 2019 21:25:46 +0000
Subject: [Buildroot] [Bug 11066] x11r7 X11 S40xorg leads to a black screen
 on QEMU x86 but startx works
In-Reply-To: <bug-11066-163@https.bugs.busybox.net/>
References: <bug-11066-163@https.bugs.busybox.net/>
Message-ID: <bug-11066-163-agMCUmVYlr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11066

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Ciro, All,

startx usually starts the X server, then a initial X client.

S40xorg only starts the server; it is up to you to provide a
later script that starts the X client you're interested in.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
