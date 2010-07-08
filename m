From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Jul 2010 14:50:40 +0000 (UTC)
Subject: [Buildroot] [Bug 2185] pixman can't apply
	pixman-0.10.0-no-tests.patch
In-Reply-To: <bug-2185-163@https.bugs.busybox.net/>
References: <bug-2185-163@https.bugs.busybox.net/>
Message-ID: <20100708145040.53FDD82794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2185

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #2)
> Same issue. My archive contains :
> 
> /mnt/WORK/bourgeois/buildroot-2010.05/output/build $ ls pixman-0.17.6/
> AUTHORS  autogen.sh  ChangeLog  CODING_STYLE  configure.ac  COPYING  INSTALL 
> Makefile.am  NEWS  pixman  pixman-1.pc.in  pixman-1-uninstalled.pc.in  README 
> RELEASING  test  TODO
> 
> No Makefile.in here. I downloaded it from
> http://cgit.freedesktop.org/pixman/snapshot/pixman-0.17.6.tar.gz

Don't do that! You get a git snapshot when you download from cgit (E.G. where
make release hasn't been run, which generates Makefile.in).

How did you get that idea? The official tarball is at
http://cairographics.org/releases/pixman-0.17.6.tar.gz which is also where
buildroot downloads it from.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
