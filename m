From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Nov 2017 16:12:13 +0000
Subject: [Buildroot] [Bug 10531] QtWebengine doesn't build if the host
 hasn't a 32 bits C++ compiler working
In-Reply-To: <bug-10531-163@https.bugs.busybox.net/>
References: <bug-10531-163@https.bugs.busybox.net/>
Message-ID: <bug-10531-163-OrXTupm64G@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10531

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
More globally: qt5webengine will build host tools that are the
same bitness as the target, so it is not possible to build for
a 64-bit target on a 32-bit host.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
