From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 May 2017 13:12:13 +0000
Subject: [Buildroot] [Bug 9896] host-gcc-initial error downloading because
	incorrect URL
In-Reply-To: <bug-9896-163@https.bugs.busybox.net/>
References: <bug-9896-163@https.bugs.busybox.net/>
Message-ID: <bug-9896-163-4ZQou8V7I9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9896

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Running "make host-gcc-initial" doesn't make any sense when the configuration
specifies to use an external toolchain.

If you're not familiar with Buildroot, don't run anything but just "make".

-- 
You are receiving this mail because:
You are on the CC list for the bug.
