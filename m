From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 11:54:33 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-lUyCkcNFBT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Bilge,

Nothing in Buildroot requires building as root. Building as root is not
supported (at least, not officially).

I'm not sure we want to take this patch. Playing with permissions (as
the name seems to imply) is not very clean IMHO. What does the doc about
--unsafe-perms says exactly?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
