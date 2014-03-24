From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Mar 2014 20:20:09 +0000 (UTC)
Subject: [Buildroot] [Bug 6986] Make legal-info fails on uboot versions
	before 2014.01
In-Reply-To: <bug-6986-163@https.bugs.busybox.net/>
References: <bug-6986-163@https.bugs.busybox.net/>
Message-ID: <20140324202009.ECB349C0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6986

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2014-03-24 20:20:09 UTC ---
Hi,

It would indeed be nice to handle this more gracefully, but that's
unfortunately not currently possible with the legal-info infrastructure.

The fact that it fails when the license file isn't available is quite nice for
testing, as the autobuilders very soon informs us of the failure (mistyped
license file, a package with a license change in a new version), but for the
end user a warning would be nicer.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
