From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Aug 2014 09:13:56 +0000 (UTC)
Subject: [Buildroot] [Bug 7136] ecryptfs-utils needs gettext to run when
 glibc/eglibc is used
In-Reply-To: <bug-7136-163@https.bugs.busybox.net/>
References: <bug-7136-163@https.bugs.busybox.net/>
Message-ID: <20140818091356.AB2679D413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7136

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-18 09:13:55 UTC ---
Bug fixed with commits
http://git.buildroot.org/buildroot/commit/?id=2bc3bca6d85bcdaa1abc582eab5e95274896fece
http://git.buildroot.org/buildroot/commit/?id=effe0beb1d6b3fe403ab30540659ffef6618e080
http://git.buildroot.org/buildroot/commit/?id=2289c34a193174967a87b432b56527cf82e0b3c2

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
