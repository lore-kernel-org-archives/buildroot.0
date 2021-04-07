From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 07 Apr 2021 09:12:52 +0000
Subject: [Buildroot] [Bug 13601] Gen image :Iappropriate ioctl error
In-Reply-To: <bug-13601-163@https.bugs.busybox.net/>
References: <bug-13601-163@https.bugs.busybox.net/>
Message-ID: <bug-13601-163-knLkaoL7Nq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13601

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git and will be part of the upcoming 2021.02.1 release:
https://git.buildroot.org/buildroot/commit/?h=2021.02.x&id=9c6c73a22d9208eb924803aaafeb17bc03a90e35

-- 
You are receiving this mail because:
You are on the CC list for the bug.
