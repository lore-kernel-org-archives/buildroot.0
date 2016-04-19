From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Apr 2016 21:28:10 +0000
Subject: [Buildroot] [Bug 8786] gdb fails to build with xz and expat support
	at the same
In-Reply-To: <bug-8786-163@https.bugs.busybox.net/>
References: <bug-8786-163@https.bugs.busybox.net/>
Message-ID: <bug-8786-163-fQ2IuypTAX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8786

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed in e6a29a4f3c48b13fde2214365067e34fbb92cfd6.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
