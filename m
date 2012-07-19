From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Jul 2012 13:53:15 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120719135315.3719296BD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #2 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-19 13:53:15 UTC ---
(In reply to comment #1)
> Can you try disabling BR2_PACKAGE_UTIL_LINUX_AGETTY=y and doing a full rebuild
> (make clean; make) ?

Yup,...
It did not help.
I have a feeling it has to do with the WCHAR (the last time i had such a
problem disabling it and everything that depended on it solved the problem).



> 
> We generally only use the getty program from Busybox, so if you use the getty
> program from util-linux, there may be a need to adapt certain configuration
> files.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
