From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:06:13 +0000 (UTC)
Subject: [Buildroot] [Bug 8121] php opcache extension doesn't get installed
In-Reply-To: <bug-8121-163@https.bugs.busybox.net/>
References: <bug-8121-163@https.bugs.busybox.net/>
Message-ID: <20150603010613.7F57C804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8121

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-03 01:06:13 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/package/php?id=ec0404a9a426e866dff20bf11b33c06b90f9f85d.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
