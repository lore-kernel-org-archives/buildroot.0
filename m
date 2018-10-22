From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2018 22:36:41 +0000
Subject: [Buildroot] [Bug 11421] GCC error message for ARM Cortex-A9/ARM.V7
In-Reply-To: <bug-11421-163@https.bugs.busybox.net/>
References: <bug-11421-163@https.bugs.busybox.net/>
Message-ID: <bug-11421-163-LupzcjSxl8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11421

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
I don't know what the "Command does not fulfill its conditions" error message
means exactly. However, a Buildroot-generated compiler is targeted for hosted
compilation. I am not sure that it is capable of generating code for a
freestanding environment, where the FIQ attribute would be relevant. You may be
better off downloading an ARM-supported toolchain from
https://developer.arm.com/open-source/gnu-toolchain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
