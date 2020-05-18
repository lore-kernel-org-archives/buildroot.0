From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 05:28:24 +0000
Subject: [Buildroot] [Bug 12631] glibc support Power-PC SPE
In-Reply-To: <bug-12631-163@https.bugs.busybox.net/>
References: <bug-12631-163@https.bugs.busybox.net/>
Message-ID: <bug-12631-163-2rG7xho3cT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12631

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Since PowerPC SPE support has been removed from upstream gcc, it doesn't seem
very relevant for Buildroot to start supporting it more widely, as we will have
to remove it in the near future as we upgrade to newer gcc versions.

See
https://github.com/gcc-mirror/gcc/commit/b31d0348ddada49453e3edaaf93a423fdc61dc79

-- 
You are receiving this mail because:
You are on the CC list for the bug.
