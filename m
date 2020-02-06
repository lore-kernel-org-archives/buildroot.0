From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Feb 2020 09:02:51 +0000
Subject: [Buildroot] [Bug 12546] Ninja 1.10 build Error
In-Reply-To: <bug-12546-163@https.bugs.busybox.net/>
References: <bug-12546-163@https.bugs.busybox.net/>
Message-ID: <bug-12546-163-xuO75icKqQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12546

yegorslists at googlemail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Target Milestone|---                         |2020.02

--- Comment #3 from yegorslists at googlemail.com ---
Hallo Damian,

thanks for testing. Could you add your Tested-By tag to my patch e-mail? See
[1] for more information.

The warning are OK. re2c is an optional dependency and "Manually-specified
variables" are common BR settings. If they cannot be applied, they are just
ignored.

[1] http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

-- 
You are receiving this mail because:
You are on the CC list for the bug.
