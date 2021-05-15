From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 May 2021 11:29:59 +0000
Subject: [Buildroot] [Bug 13806] Building host-localedef fails on fedora
 34/gcc 11
In-Reply-To: <bug-13806-163@https.bugs.busybox.net/>
References: <bug-13806-163@https.bugs.busybox.net/>
Message-ID: <bug-13806-163-JsRNEPaIhd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

Thanks for reporting this issue. We believe it has been fixed thanks to the
patch from Peter, applied upstream as commit 4174f79a5718.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
