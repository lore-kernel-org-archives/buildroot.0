From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Jan 2012 21:54:47 +0000 (UTC)
Subject: [Buildroot] [Bug 4429] buildroot 2011.08 does not build on Ubuntu
	11.10
In-Reply-To: <bug-4429-163@https.bugs.busybox.net/>
References: <bug-4429-163@https.bugs.busybox.net/>
Message-ID: <20120124215447.670BA9039B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4429

--- Comment #6 from Scott Moser <smoser@ubuntu.com> 2012-01-24 21:54:47 UTC ---
byobu sets SED to "sed" (without quotes).
so, it is really confusing to me why that would cause failure, as generally on
ubuntu 'sed' is a perfectly good "sed".

None the less, the easiest work around is to unset it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
