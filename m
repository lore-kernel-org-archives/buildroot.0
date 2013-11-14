From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:20:16 +0000 (UTC)
Subject: [Buildroot] [Bug 4327] I use the i686-linux-gcc-4.6.1 compiled
 grub-0.97 does not work
In-Reply-To: <bug-4327-163@https.bugs.busybox.net/>
References: <bug-4327-163@https.bugs.busybox.net/>
Message-ID: <20131114002016.3D5599BC98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4327

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:20:15 UTC ---
I've recently posted a set of patches against grub, and it was working for me
on x86. Can you test the patches at
http://lists.busybox.net/pipermail/buildroot/2013-November/082351.html and
report if they fix the problem for you?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
