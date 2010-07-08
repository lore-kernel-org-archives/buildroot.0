From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Jul 2010 14:27:42 +0000 (UTC)
Subject: [Buildroot] [Bug 2185] pixman can't apply
	pixman-0.10.0-no-tests.patch
In-Reply-To: <bug-2185-163@https.bugs.busybox.net/>
References: <bug-2185-163@https.bugs.busybox.net/>
Message-ID: <20100708142742.CB5C782793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2185

--- Comment #2 from Anthoine Bourgeois <bourgeois@bertin.fr>  ---
Same issue. My archive contains :

/mnt/WORK/bourgeois/buildroot-2010.05/output/build $ ls pixman-0.17.6/
AUTHORS  autogen.sh  ChangeLog  CODING_STYLE  configure.ac  COPYING  INSTALL 
Makefile.am  NEWS  pixman  pixman-1.pc.in  pixman-1-uninstalled.pc.in  README 
RELEASING  test  TODO

No Makefile.in here. I downloaded it from
http://cgit.freedesktop.org/pixman/snapshot/pixman-0.17.6.tar.gz

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
