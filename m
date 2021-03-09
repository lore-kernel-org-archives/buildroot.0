From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Mar 2021 20:45:59 +0000
Subject: [Buildroot] [Bug 13601] Gen image :Iappropriate ioctl error
In-Reply-To: <bug-13601-163@https.bugs.busybox.net/>
References: <bug-13601-163@https.bugs.busybox.net/>
Message-ID: <bug-13601-163-6hnZ9l1ZEf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13601

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Peter Seiderer from comment #2)
> similar/same failure was already reported, see #13146

But 13146 was about WSL1, no? That error is not supposed to hapen under WSL2,
as I understand it...

NirajTummala, are you sure you are using WSL2? Care to double-check, please?

> latest genimage version bump (see [3]), not yet in 2021.02, only on git master...

Could you please send a patch for 2021.02 with just a backport of that fix,
please?

(yes, I know I was not in favour of it back then, but since upstream did apply
it, then we can backport it now).

Thanks!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
