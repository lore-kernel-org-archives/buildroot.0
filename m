From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Oct 2013 06:33:02 +0000 (UTC)
Subject: [Buildroot] [Bug 6572] [PowerPC] Buildroot uses wrong external
 toolchain libraries for non-generic architecture variants
In-Reply-To: <bug-6572-163@https.bugs.busybox.net/>
References: <bug-6572-163@https.bugs.busybox.net/>
Message-ID: <20131021063302.3D4579B78F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6572

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-10-21 06:33:01 UTC ---
Did you set BR2_TARGET_OPTIMIZATION ("Target optimizations") correctly in the
toolchain menu? The help text of the CodeSourcery toolchains mention this:

-------
- e500v2 glibc, 32 bits
  Set BR2_TARGET_OPTIMIZATION to -te500v2
-------

If this does not work for you, feel free to discuss this problem on the mailing
list, IRC, or reopen this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
