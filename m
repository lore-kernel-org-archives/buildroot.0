From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Mar 2014 11:53:42 +0000 (UTC)
Subject: [Buildroot] [Bug 6956] Packaging libsoxr
In-Reply-To: <bug-6956-163@https.bugs.busybox.net/>
References: <bug-6956-163@https.bugs.busybox.net/>
Message-ID: <20140312115343.90E4E9BF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6956

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-03-12 11:53:38 UTC ---
There shouldn't be a real need to understand cmake in order to make a package
available in buildroot. Have you had a look at this part of the manual?
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages 

Buildroot has a 'cmake-package' infrastructure, which makes it easy to add
packages that have cmake makefiles.

If you can, implementing this yourself will create much bigger chances of the
changes becoming available in buildroot, because other buildroot developers
already have a lot of other work, so may not start on libsoxr.

Thanks in advance...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
