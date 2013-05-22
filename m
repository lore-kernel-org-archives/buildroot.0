From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 May 2013 13:34:43 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20130522133443.DCFCB9A20D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #15 from richard.genoud at gmail.com 2013-05-22 13:33:35 UTC ---
(In reply to comment #14)
> No, as I said, it's happening to me now on 3.9. What's strange is that I had
> been going along fine, then I changed some kernel options that I would not
> expect to have anything to do with this, and now `make uImage` is clobbering my
> zImage, so it's not as simple as that it always/never happens on specific
> kernel versions.
Could you try to isolate the config option that change the behavior ? (or give
a .config that overwrite zImage, and another that doesn't)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
