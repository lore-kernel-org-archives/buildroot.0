From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Mar 2015 18:39:53 +0000 (UTC)
Subject: [Buildroot] [Bug 7931] Default configuration for Cubieboard v1 is
	outdated
In-Reply-To: <bug-7931-163@https.bugs.busybox.net/>
References: <bug-7931-163@https.bugs.busybox.net/>
Message-ID: <20150315183953.B426380795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7931

--- Comment #2 from mfld.fr at gmail.com 2015-03-15 18:39:53 UTC ---
Hello Thomas, first I would like to thank you for all the work you did on
BuildRoot, because it helped me a lot to run my BBB and now my CB1.

Back to the problem reported here:

I used a fresh new v2015.02, and the commit that was in the defconfig is the
following:
https://github.com/linux-sunxi/linux-sunxi/commit/274a66a7bfcbaabb88d63e4eba161965383cc416

As you can see, this commit is commented as 'Merge branch 'reference-3.0' into
sunxi-3.0', and referenced in the branch 'sunxi-3.0'.

In the serial console, I also saw that the linux kernel version was 3.0.y, not
3.4.y in the very first lines before the panic. This is why I stopped to test
that config and updated to latest linux-sunxi v3.4.y branch, that works very
well.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
