From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Dec 2011 11:22:23 +0000 (UTC)
Subject: [Buildroot] [Bug 4622] Unable to download properly file
	fakeroot_1.9.5.tar.gz
In-Reply-To: <bug-4622-163@https.bugs.busybox.net/>
References: <bug-4622-163@https.bugs.busybox.net/>
Message-ID: <20111219112223.B9E958FAB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4622

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> 2011-12-19 11:22:23 UTC ---
(In reply to comment #5)
> Following the make file development...
> 
> --2011-12-19 11:25:34-- 
> http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot//fakeroot_1.9.5.tar.gz

That's not the right URL. What Buildroot version are you using? We fixed this
back in March 2011 when snapshot.debian.net moved to .debian.org.

Please consider moving to the last 2011.11 release.

> `/home/darwin/arco/Documents/linuxbuild-1.0.1/dist/buildroot/downloads/fakeroot_1.9.5.tar.gz'

What is this linuxbuild?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
