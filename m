From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Feb 2014 14:38:54 +0000 (UTC)
Subject: [Buildroot] [Bug 5768] Not able to build ALSA-Lib for static build
In-Reply-To: <bug-5768-163@https.bugs.busybox.net/>
References: <bug-5768-163@https.bugs.busybox.net/>
Message-ID: <20140223143854.1E6A29B838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5768

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-23 14:38:53 UTC ---
Fixed with commits
http://git.buildroot.org/buildroot/commit/?id=8d911f9b7bd7beac94a3255b29ebe432405d511f
and
http://git.buildroot.org/buildroot/commit/?id=ffd7a00aef72359c630046fbb84d735a9f06db8a.

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
