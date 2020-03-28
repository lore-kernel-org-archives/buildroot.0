From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Mar 2020 18:30:08 +0000
Subject: [Buildroot] [Bug 12716] bio.h not found
In-Reply-To: <bug-12716-163@https.bugs.busybox.net/>
References: <bug-12716-163@https.bugs.busybox.net/>
Message-ID: <bug-12716-163-1N1QxsUinQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12716

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
>  #include <openssl/bio.h>
>           ^~~~~~~~~~~~~~~
> compilation terminated.

You need to enable BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
