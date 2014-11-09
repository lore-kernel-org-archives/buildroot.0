From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 13:23:19 +0000 (UTC)
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <20141109132319.78BD2B2BF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-09 13:23:19 UTC ---
Unfortunately, due to lack of details, it's hard to know whether this bug is
really a Buildroot bug, or a configuration error in the kernel arguments /
usage of the Buildroot image. Since there is really not much difference between
the process to generate an ext2 and ext3 image in Buildroot, I'm leaning
towards some other configuration issue done by the bug reporter when using the
Buildroot image.

I'll therefore mark this bug as "worksforme", since we're using the ext2
filesystem image successfully on other systems. Feel free to reopen with more
details (kernel version, kernel configuration, kernel argument, full kernel
log) if you don't agree with my conclusion.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
