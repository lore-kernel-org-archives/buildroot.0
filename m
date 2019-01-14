From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Jan 2019 21:33:23 +0000
Subject: [Buildroot] [Bug 11616] 2018.02.09 fails to build libzlib with full
 RELRO protection
In-Reply-To: <bug-11616-163@https.bugs.busybox.net/>
References: <bug-11616-163@https.bugs.busybox.net/>
Message-ID: <bug-11616-163-5B7wppbTcZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11616

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Full RELRO has been fixed post-2018.02 by changing the toolchain-wrapper. This
is too invasive to backport in 2018.02, so only later Buildroot versions will
have proper full RELRO support.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
