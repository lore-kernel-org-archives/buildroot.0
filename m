From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Mar 2016 20:24:20 +0000
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <bug-7580-163-1Rtqfv374n@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #11 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by commit:

commit 000b972f49bcf9ed35417bb787a4440f22b12f8e
Author: Sergio Prado <sergio.prado@e-labworks.com>
Date:   Tue Feb 9 16:14:52 2016 -0200

    configs: pandaboard: bump u-boot to 2015.10 and kernel to 4.3

    VFPv3 and NEON was enabled and a readme.txt file was added.

    Fixes bug #7580.

    Tested on Pandaboard ES.

    [Peter: use EABIhf]
    Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
