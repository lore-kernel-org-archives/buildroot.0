From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jul 2014 21:34:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7250] Cannot build with -std=c++11
In-Reply-To: <bug-7250-163@https.bugs.busybox.net/>
References: <bug-7250-163@https.bugs.busybox.net/>
Message-ID: <20140707213451.355AE9D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7250

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-07 21:34:49 UTC ---
Created attachment 5498
  --> https://bugs.busybox.net/attachment.cgi?id=5498
gcc patch

Could you put this patch in package/gcc/4.8.3/ in the Buildroot sources,
rebuild the toolchain, and try again? Here it seems to fix the problem. It
would be good if you could also test the runtime execution of the program.
Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
