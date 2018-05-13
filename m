From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 May 2018 20:23:38 +0000
Subject: [Buildroot] [Bug 10986] Installing package attr when already
 supplied by busybox replaces busybox. Resulting in confusing boot/init
 error.
In-Reply-To: <bug-10986-163@https.bugs.busybox.net/>
References: <bug-10986-163@https.bugs.busybox.net/>
Message-ID: <bug-10986-163-aKKIuc9iAp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10986

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

We believe this was fixed with:
   
https://git.buildroot.org/buildroot/commit/?id=28d8f8dfd5b10748b009377445d710abef6b8502

Additionally, a similar fix was applied to acl:
   
https://git.buildroot.org/buildroot/commit/?id=c3e62d39844b28b59650747e59e86a21d71f05c8

Thank you for the report! :-)

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
