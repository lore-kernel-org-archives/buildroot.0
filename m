From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Apr 2013 13:36:36 +0000 (UTC)
Subject: [Buildroot] [Bug 6218] binutils-2.23.2/gas fails with undefined
 reference to `mbstowcs'
In-Reply-To: <bug-6218-163@https.bugs.busybox.net/>
References: <bug-6218-163@https.bugs.busybox.net/>
Message-ID: <20130425133636.8D32D9B828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6218

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-04-25 13:36:58 UTC ---
Does this happen after a complete 'make clean; make' cycle?

If so, could you attach your Buildroot .config file to the bug?

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
