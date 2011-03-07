From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 18:55:06 +0000 (UTC)
Subject: [Buildroot] [Bug 3391] Add support for specifying an external
	kernel tree
In-Reply-To: <bug-3391-163@https.bugs.busybox.net/>
References: <bug-3391-163@https.bugs.busybox.net/>
Message-ID: <20110307185506.2F7988E217@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3391

--- Comment #1 from Will Wagner <will_wagner@carallon.com>  ---
Martin,

I have used this a bit and it seems fine. One addition I have hacked in is an
option to allow the output files to reside in the buildroot output folder using
the O= option to kernel make.

This allows me to have a directory containing the kernel source which does not
get modified by a build and then the build files go into
$(O)/build/linux-custom. If you are interested I could probably clean up my
patch and submit.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
