From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Feb 2014 08:17:22 +0000 (UTC)
Subject: [Buildroot] [Bug 5030] busybox built fails if we use an override
 src dir BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain .config
In-Reply-To: <bug-5030-163@https.bugs.busybox.net/>
References: <bug-5030-163@https.bugs.busybox.net/>
Message-ID: <20140220081722.D0BD89CA9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5030

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-20 08:17:22 UTC ---
This bug has been fixed with commit 
http://git.buildroot.org/buildroot/commit/?id=eedfc7121cf5b9a8dee8546c85b3bd36e9a743a4

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
