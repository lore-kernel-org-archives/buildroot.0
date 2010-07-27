From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 21:32:26 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] external toolchain linking error
In-Reply-To: <bug-1741-163@https.bugs.busybox.net/>
References: <bug-1741-163@https.bugs.busybox.net/>
Message-ID: <20100727213226.F16CC83639@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #16 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Even though I didn't reproduce the /lib/libc.so.0 failure during the gettext
build as our reporter did,
http://git.buildroot.net/buildroot/commit/?id=3c77bab2eeace3ee675bd745ca335fa3dd1630bb
fixes a similar problem. So I think this bug has been fixed now.

If you manage to reproduce the bug with the current Buildroot Git, please
reopen this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
