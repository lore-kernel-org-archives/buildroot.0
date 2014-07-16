From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Jul 2014 17:01:37 +0000 (UTC)
Subject: [Buildroot] [Bug 6230] Cannot compile gcc without threads
	(uClibc-based)
In-Reply-To: <bug-6230-163@https.bugs.busybox.net/>
References: <bug-6230-163@https.bugs.busybox.net/>
Message-ID: <20140716170137.D96E49D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6230

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-07-16 17:01:36 UTC ---
Support for ARM(7TDMI/720T/740T) has been dropped from buildroot with commit 
http://git.buildroot.org/buildroot/commit/?id=befab216a29927f598e0a3ba0b012f7e822bb235

Commit message is:
"    arch/arm: drop ARM(7TDMI/720T/740T) support

    The toolchain currently doesn't build for nommu ARM and is in need of
    serious work.
    Problem is there are no emulation targets and real ARM(7TDMI/720T/740T)
    hardware that's capable of running linux (enough memory, having a
    memory controller...) is VERY rare and uses very old versions to
    make it usable.

    The ARM nommu focus should go into Cortex M series processors that are
    obtainable at reasonable cost on modern hardware that has external
    memory controllers.
"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
