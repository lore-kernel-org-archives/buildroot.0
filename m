From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  9 Jul 2014 11:27:10 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] python 2.7 compilation issue on a
 Debian/Ubuntu host with multiarch support
In-Reply-To: <bug-7268-163@https.bugs.busybox.net/>
References: <bug-7268-163@https.bugs.busybox.net/>
Message-ID: <20140709112710.AA8E59D1DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #16 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-09 11:27:10 UTC ---
Python 2.x fixed in
http://git.buildroot.net/buildroot/commit/?id=5476b7273f0e5e58b59da9bf6403366d08e6b585,
and Python 3.x fixed in
http://git.buildroot.net/buildroot/commit/?id=5364b22b6c309073d59f593c3b5b1a9b3246e957.

Closing bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
