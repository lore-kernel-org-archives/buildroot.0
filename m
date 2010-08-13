From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Aug 2010 14:21:00 +0000 (UTC)
Subject: [Buildroot] [Bug 2371] QT MYSQL Module does not build
In-Reply-To: <bug-2371-163@https.bugs.busybox.net/>
References: <bug-2371-163@https.bugs.busybox.net/>
Message-ID: <20100813142100.2EE7A87458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2371

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok. However, even if MySQL is installed on the host, we should be able to work
properly. The Qt configure output is not verbose enough to understand what's
going on, we'd need the full link command line. Could you have a look at Qt
./configure and config.tests/unix/compile.test to see how more information
could be shown ?

For the record, on which distro (and version) and with which packages installed
exactly the problem was happening ?

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
