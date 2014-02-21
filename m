From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Feb 2014 07:43:29 +0000 (UTC)
Subject: [Buildroot] [Bug 4706] Removing .stamp_target_installed does not
 trigger reinstall libraries
In-Reply-To: <bug-4706-163@https.bugs.busybox.net/>
References: <bug-4706-163@https.bugs.busybox.net/>
Message-ID: <20140221074329.62E169CB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4706

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-21 07:43:27 UTC ---
I'm closing this bug as Wontfix, for the following reasons:
- buildroot aims at being clear and simple, and the behavior desired by the
submitter is not 'simple'.
- we have other mechanisms in place to modify the target without touching the
skeleton.


Please have a look at the post-build and rootfs-overlay mechanisms:
http://www.buildroot.org/downloads/manual/manual.html#rootfs-custom

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
