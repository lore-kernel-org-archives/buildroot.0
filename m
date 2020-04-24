From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Apr 2020 19:02:06 +0000
Subject: [Buildroot] [Bug 12811] bootstrap stuck and no login prompt
In-Reply-To: <bug-12811-163@https.bugs.busybox.net/>
References: <bug-12811-163@https.bugs.busybox.net/>
Message-ID: <bug-12811-163-WU2pWS2Gf7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12811

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
> Thanks. I naively assumed such changed would be done automatically.

No..., buildroot is not about automatically customizing every possible
selection of features..., just a starting point for your own project (see below
and [1] for customize support)...

> It worked for the cmdline.txt.

Good news...

> For the openssh however, I assume that is a change that can only be done with post-scripts?

Yes, one of the many possibilities to customize your project, see [1] for
alternatives...

Closing the bug (as it is not a bug, but a feature ;-)), feel free to turn to
the mailing list for further questions/support...

[1] https://buildroot.org/downloads/manual/manual.html#rootfs-custom

-- 
You are receiving this mail because:
You are on the CC list for the bug.
