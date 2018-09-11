From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 09:08:37 +0000
Subject: [Buildroot] [Bug 11326] sysvinit fails to build in latest GIT master
In-Reply-To: <bug-11326-163@https.bugs.busybox.net/>
References: <bug-11326-163@https.bugs.busybox.net/>
Message-ID: <bug-11326-163-JjSbqcypCR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11326

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. Could you submit this as a proper patch on the
Buildroot mailing list ? The patch on sysvinit should be Git-formatted, since
sysvinit has a Git repository at
http://git.savannah.nongnu.org/cgit/sysvinit.git.

Also, I see that our sysvinit package is using some 2.88 version from Debian +
Debian patches. But upstream seems to be a bit active at
http://git.savannah.nongnu.org/cgit/sysvinit.git, and a 2.90 version was
released in June 2018. Perhaps it would make sense to use it, there is a
tarball at http://download.savannah.nongnu.org/releases/sysvinit/. Since you're
interested in sysvinit :-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
