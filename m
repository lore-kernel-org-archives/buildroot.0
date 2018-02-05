From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Feb 2018 18:10:13 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-b50GaKeFOd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #12 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Bob from comment #11)
So you  using the fakeroot and the mksquashfs from your distribution?

we do not support those. Buildroot builds and uses its own fakeroot
and its own mksquashfs.

Sin you are usign the ones from your distribution, and that it is a
pretty "old" disgribution, it is not unsurprising that it does not
have the fxes we do have...

Try using the fakeroot and mksquashfs provided by Buildroot, and
check if you still have the issue. In the meantime, I don't think
this is a Buildroot issue so I'm closing.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
