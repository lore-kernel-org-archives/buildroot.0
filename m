From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  7 Mar 2009 13:11:04 +0000 (UTC)
Subject: [Buildroot] [Bug 111] binutils 2.17 fails to build when texinfo >=
	4.10
In-Reply-To: <bug-111-163@https.bugs.busybox.net/>
References: <bug-111-163@https.bugs.busybox.net/>
Message-ID: <20090307131104.65ADE76525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=111





--- Comment #3 from Luke <luke_tucker@yahoo.co.uk>  2009-03-07 13:11:03 UTC ---
The reason I was using binutils 2.17 is because I'm building applications for a
reverse engineered platform (TViX DVICO 6500) and I am trying to keep
everything as close to the toolchain used by the original developers even
though 2.19 will probably work as you say.

Thanks for the fix.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
