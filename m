From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2009 07:59:14 +0000 (UTC)
Subject: [Buildroot] [Bug 299] add shared-mime-info package
In-Reply-To: <bug-299-163@https.bugs.busybox.net/>
References: <bug-299-163@https.bugs.busybox.net/>
Message-ID: <20090429075914.49D627625C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=299





--- Comment #7 from Sven Neumann <s.neumann@raumfeld.com>  2009-04-29 07:59:13 UTC ---
If a package needs to add mime-types, then it needs to install them in
staging_dir and invoke update-mime-database with the correct paths. In order to
make this work, we probably need to install update-mime-database into host_dir.
It shouldn't be hard to get this working. So far I don't have a need for this
though and without a package that actually installs new mime-types it is
probably not worth to prepare the infrastructure for this.

I suggest that this bug is closed as FIXED.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
