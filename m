From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jul 2012 19:09:16 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120726190916.56E5F96DF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #12 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-26 19:09:16 UTC ---
(In reply to comment #10)
> It would be nice to figure out why the /bin/login from util-linux doesn't work.
> My initial suspicion would be that it lacks the SUID-root bit set, but on my
> system /bin/login doesn't have this bit set. Or maybe the util-linux /bin/login
> requires some configuration file that we don't have or something.

> Have you tried changing root:x: to root:: in /etc/passwd?

Yes, i have. This does make it work (i can login), but since this is a 'hack'
(i don't know why this makes it work) i refrained from using this in our
system.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
