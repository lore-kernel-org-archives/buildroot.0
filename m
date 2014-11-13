From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 22:37:40 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141113223740.32E77B1D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #12 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-13 22:37:39 UTC ---
Patch to workaround the problem in Python 3 sent to Buildroot:
http://lists.busybox.net/pipermail/buildroot/2014-November/112005.html

uClibc bug reproduced with uClibc master, and bug reported to upstream uClibc:
http://lists.uclibc.org/pipermail/uclibc/2014-November/048718.html.

Since I don't expect the uClibc folks to react quickly, I would propose to mark
this bug as fixed once the Python 3 workaround is committed in Buildroot.

Beyonlo, can you test the Buildroot patch for Python 3, and report if it works
for you (it works for me, so I'm pretty sure it's ok, but still). Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
