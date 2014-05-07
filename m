From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  7 May 2014 13:09:06 +0000 (UTC)
Subject: [Buildroot] [Bug 6992] Incorrect installation rights on external
 kernel module makes it unloadable
In-Reply-To: <bug-6992-163@https.bugs.busybox.net/>
References: <bug-6992-163@https.bugs.busybox.net/>
Message-ID: <20140507130906.246E99CB0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6992

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-05-07 13:09:05 UTC ---
Fixed with commit
http://git.buildroot.org/buildroot/commit/?id=066359166fa9407382fd9ce40e002249dbdda9c7

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
