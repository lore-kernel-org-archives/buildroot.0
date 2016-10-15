From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Oct 2016 15:37:59 +0000
Subject: [Buildroot] [Bug 8941] "ls" of an NFSv4 share only works when
 pumped through strace
In-Reply-To: <bug-8941-163@https.bugs.busybox.net/>
References: <bug-8941-163@https.bugs.busybox.net/>
Message-ID: <bug-8941-163-wr5IXqD3XX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8941

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report, and sorry for the slow response.

Unfortunately, this doesn't really look like a Buildroot problem, but most
likely a kernel problem.

Can you test the same kernel, with another distribution (like a Debian
distribution) ? Which C library are you using ? If you're using uClibc, can you
try glibc ? Is it happening with a different hardware platform, like if you
boot the Buildroot system under Qemu ?

We would really need you to investigate further this bug.

Alternatively, you could provide a detailed step-by-step process on how to
reproduce the bug: a minimal Buildroot Qemu based defconfig that exhibits the
problem, together with the details on how to setup a NFSv4 server. As it is,
it's too much effort to setup everything that's needed to reproduce your bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
