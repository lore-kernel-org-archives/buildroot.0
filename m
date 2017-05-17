From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 12:32:51 +0000
Subject: [Buildroot] [Bug 9876] aarch64 support with gcc 4.8 toolchain
In-Reply-To: <bug-9876-163@https.bugs.busybox.net/>
References: <bug-9876-163@https.bugs.busybox.net/>
Message-ID: <bug-9876-163-0lRiv1DfNT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9876

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Jean-pierre Cartal from comment #0)

You could remove the lp64 line from arch/Config.in.arm, but considering how old
gcc 4.8 is compared to aarch64, does it really make sense to use such an old
toolchain?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
