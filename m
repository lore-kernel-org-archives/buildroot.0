From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Jul 2010 20:14:20 +0000 (UTC)
Subject: [Buildroot] [Bug 1339] Busybox needs -fno-strict-aliasing to
	compile cleanly
In-Reply-To: <bug-1339-163@https.bugs.busybox.net/>
References: <bug-1339-163@https.bugs.busybox.net/>
Message-ID: <20100718201420.78D0F82B92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1339

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #1)
> I'd rather say that this issue should be fixed at the Busybox level rather than
> in Buildroot. Peter, your opinion ?

Yes. And as they are just warnings and not errors it isn't a big problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
