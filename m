From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Aug 2017 14:03:23 +0000
Subject: [Buildroot] [Bug 10156] glibc compilation fails for X86 32bits
	(i386)
In-Reply-To: <bug-10156-163@https.bugs.busybox.net/>
References: <bug-10156-163@https.bugs.busybox.net/>
Message-ID: <bug-10156-163-rAXnQIEMRH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10156

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=163b6a5b39ad5b11b8ffa1704bc60a4ed09ee6b5.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
