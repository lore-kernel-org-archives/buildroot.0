From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Aug 2017 16:19:56 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-qYzF2jh5Mm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Clayton, All,

The patch has been applied:
   
https://git.buildroot.org/buildroot/commit/?id=eff989bab851ab01d190f3771558eb6ac30af255

Obviously, we're still interested in feeback, so feel free to re-open
if you're still affected by the issue.

Most notably, can you check that the xattr you get in your generated
filesystem are correct?

Thanks!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
