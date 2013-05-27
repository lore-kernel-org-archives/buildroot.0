From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 May 2013 15:14:16 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20130527151416.8F7D29A3B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #17 from Maxime Ripard <maxime.ripard@free-electrons.com> 2013-05-27 15:13:10 UTC ---
(In reply to comment #16)
> I was hoping to spend some time to get a minimal example, but I haven't gotten
> to it yet, but I wanted to get something up in case anyone else is looking into
> this at the same time. This config does have the problem.

I couldn't reproduce the problem here with 3.9 and the config you were pointing
to. Anyway, since 3.7 is quite recent anyway, we can always merge the patch, it
does no harm, and fixes things for some users.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
