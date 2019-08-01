From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Aug 2019 16:27:05 +0000
Subject: [Buildroot] [Bug 12051] package/dhcp installs libtool wrapper
 scripts on target instead of real binaries
In-Reply-To: <bug-12051-163@https.bugs.busybox.net/>
References: <bug-12051-163@https.bugs.busybox.net/>
Message-ID: <bug-12051-163-dU6YhdUKU9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12051

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=ffe5fcadfcd42af8a582b8f5fe49b56900b43a51.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
