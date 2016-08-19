From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Aug 2016 09:27:06 +0000
Subject: [Buildroot] [Bug 9181] Compiling linux kernel fails if
 BR2_LINUX_KERNEL_TOOL_CPUPOWER is selected
In-Reply-To: <bug-9181-163@https.bugs.busybox.net/>
References: <bug-9181-163@https.bugs.busybox.net/>
Message-ID: <bug-9181-163-LY9vaaUJ8d@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9181

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed in commit f55adea434876cf1ee2604abe367ed1b6c555faf.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
