From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Oct 2012 14:32:34 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20121003143234.CF7FF996D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-10-03 14:32:34 UTC ---
Maxime is testing with a more recent kernel version (3.6). Maybe things have
changed since 2.6.33/3.0 that you are testing?

Maxime, would be good if you could test with older kernel versions as well.
They are not old enough to not support them in Buildroot (even though testing
those DT related features with 2.6.33 is kind of useless since there was no DT
on ARM at 2.6.33).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
