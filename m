From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Mar 2020 14:21:06 +0000
Subject: [Buildroot] [Bug 12711] host-localedef 2.30-20 fails to compile on
 fedora 32 (gcc 10.0.1)
In-Reply-To: <bug-12711-163@https.bugs.busybox.net/>
References: <bug-12711-163@https.bugs.busybox.net/>
Message-ID: <bug-12711-163-X2lhmK4L7x@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12711

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Fixed with commit 13cc36dcfe from Peter, thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
