From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 Jul 2016 09:16:33 +0000
Subject: [Buildroot] [Bug 9111] glibc 2.23: libmvec.so not copied
In-Reply-To: <bug-9111-163@https.bugs.busybox.net/>
References: <bug-9111-163@https.bugs.busybox.net/>
Message-ID: <bug-9111-163-kQH7EITsI4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9111

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

It is my understanding that libmvec is only available for x86_64 (at
least for now, seeing that glibc only has code for it on x86_64), so we
can't copy it unconditionally.

Care to send a patch to the list, please? See the manual:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

Also, it would be nice to handle the external toolchains, too. Would you
look at it?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
