From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:09:24 +0000 (UTC)
Subject: [Buildroot] [Bug 7971] python-flask,
	python-werkzeug. No module named zlib
In-Reply-To: <bug-7971-163@https.bugs.busybox.net/>
References: <bug-7971-163@https.bugs.busybox.net/>
Message-ID: <20150603010924.BE0118179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7971

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 01:09:24 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/package/python?id=238bf198cf4f31a3301b81a924d5e22044945955

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
