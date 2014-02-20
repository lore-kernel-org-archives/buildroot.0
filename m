From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Feb 2014 08:19:30 +0000 (UTC)
Subject: [Buildroot] [Bug 6542] external python modules fail to compile to
 pyc if \\N escapes are used
In-Reply-To: <bug-6542-163@https.bugs.busybox.net/>
References: <bug-6542-163@https.bugs.busybox.net/>
Message-ID: <20140220081930.C07DF9CAD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6542

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-20 08:19:30 UTC ---
Problem fixed with commit
http://git.buildroot.org/buildroot/commit/?id=c3d539b53ff0533e91ae849dbdcdd589b0fec0cc

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
