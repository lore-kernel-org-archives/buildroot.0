From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Jan 2016 21:41:57 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-uGfRe2Keua@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git by:

commit 6fc5de4ef466b649b37a86e4f4994a667149dd80
Author: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date:   Mon Jan 4 16:33:56 2016 -0200

    fakeroot: fix build when libcap-dev is installed

    Fixes https://bugs.busybox.net/show_bug.cgi?id=8541

    Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
    Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
