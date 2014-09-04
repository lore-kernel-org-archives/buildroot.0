From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Sep 2014 12:22:52 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit doesn't start with glibc 2.19 because
 geteuid() fails
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140904122252.A42649D5EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

--- Comment #3 from syntheticpp at gmx.net 2014-09-04 12:22:51 UTC ---
> 
> How did you manage to have a statically-linked monit when using a
> glibc toolchain? Care to share your .config, please?
> 

It's the configuration of 2014.08 no changes by me.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
