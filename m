From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Oct 2009 17:46:46 +0000 (UTC)
Subject: [Buildroot] [Bug 515] tcpreplay: new package
In-Reply-To: <bug-515-163@https.bugs.busybox.net/>
References: <bug-515-163@https.bugs.busybox.net/>
Message-ID: <20091030174646.758D07764A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=515





--- Comment #7 from Chris Packham <judge.packham@gmail.com>  2009-10-30 17:46:45 UTC ---
Added updated patches.

The commit 057568255 (autotoolify of libpcap) inadvertently stopped the pcap.h
header file from being installed into the staging directory. The first new
patch fixes this. The 2nd new patch addresses the comments from Peter and
should fix tcpreplay-3.4.3-010-cross-compile.patch so that it applies.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
