From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Feb 2009 07:38:18 +0000 (UTC)
Subject: [Buildroot] [Bug 111] binutils 2.17 fails to build when texinfo >=
	4.10
In-Reply-To: <bug-111-163@https.bugs.busybox.net/>
References: <bug-111-163@https.bugs.busybox.net/>
Message-ID: <20090218073818.8D52476ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=111


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-18 07:38:16 UTC ---
Ok, thanks for reporting. Why would you want to use binutils 2.17 instead of
2.19? Do you have the same issue with 2.19?

As you probably noticed, 2.17 is marked as deprecated and is scheduled to go
away in the next release (2009.05).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
