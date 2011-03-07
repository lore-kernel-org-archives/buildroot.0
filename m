From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 19:18:27 +0000 (UTC)
Subject: [Buildroot] [Bug 3391] Add support for specifying an external
	kernel tree
In-Reply-To: <bug-3391-163@https.bugs.busybox.net/>
References: <bug-3391-163@https.bugs.busybox.net/>
Message-ID: <20110307191827.E30C38F3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3391

--- Comment #2 from Martin Hicks <mort@bork.org>  ---

> 
> I have used this a bit and it seems fine. One addition I have hacked in is an
> option to allow the output files to reside in the buildroot output folder using
> the O= option to kernel make.

Yeah, good idea.  If you send me a patch I'll wrap it up as one patch for Peter
and repost to bugzilla.

Thanks,
mh

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
