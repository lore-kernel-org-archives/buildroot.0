From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 May 2014 08:13:48 +0000 (UTC)
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <bug-7016-163@https.bugs.busybox.net/>
References: <bug-7016-163@https.bugs.busybox.net/>
Message-ID: <20140514081348.417189CBEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7016

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-05-14 08:13:47 UTC ---
Investigation was discussed further on the mailing list, see
http://lists.busybox.net/pipermail/buildroot/2014-April/093307.html
http://lists.busybox.net/pipermail/buildroot/2014-May/095513.html

The issue could not be reproduced using the same configuration in qemu.
My assumption is that the way the rootfs is run through docker is causing
trouble, and thus that it isn't a buildroot problem.
Therefore, I'm going to close this bug.

Brian: do not hesitate to continue the discussion on the mailing list, or to
reopen this bug if you think it effectively is a buildroot bug.

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
