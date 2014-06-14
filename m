From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Jun 2014 19:43:01 +0000 (UTC)
Subject: [Buildroot] [Bug 5750] Doing a Buildroot build from /usr doesn't
	work
In-Reply-To: <bug-5750-163@https.bugs.busybox.net/>
References: <bug-5750-163@https.bugs.busybox.net/>
Message-ID: <20140614194301.C26939CFDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5750

--- Comment #10 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-06-14 19:43:00 UTC ---
(In reply to comment #8)
> (In reply to comment #7)
> > This fixes the problem for me.
> 
> Thanks, I will definitely test this out!

It seems that the result is similar to the patch I was using until now
(attached). It works fine too, but if you grep in output/staging you will find
still occurrences of /usr/path/to/buildroot/.../sysroot/usr/path/to/buildroot,
caused by pkgconfig, as mentioned in
http://lists.busybox.net/pipermail/buildroot/2014-February/089866.html.
While this seems to do no harm, I intend to track down this issue further.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
