From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2016 15:13:00 +0000
Subject: [Buildroot] [Bug 7802] host-python build hangs compiling
	getbuildinfo.o
In-Reply-To: <bug-7802-163@https.bugs.busybox.net/>
References: <bug-7802-163@https.bugs.busybox.net/>
Message-ID: <bug-7802-163-QXebK6VkH8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7802

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=d0d9ba275a89cf3c71eda822d5ebf30c348ec6c7
and
https://git.buildroot.org/buildroot/commit/?id=4f76d86d998e7a13e7bfa32238bcd217fbc96a42.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
