From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Aug 2018 20:25:10 +0000
Subject: [Buildroot] [Bug 10996] bogus musl ARM toolchain
In-Reply-To: <bug-10996-163@https.bugs.busybox.net/>
References: <bug-10996-163@https.bugs.busybox.net/>
Message-ID: <bug-10996-163-hOI3SUqwhP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Closing this bug: the musl developers said that -static must be passed when
linking statically, even if the C library was built with static linking support
only.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
