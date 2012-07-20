From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Jul 2012 11:27:00 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] can't login (root or default)
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <20120720112700.2A27D9032A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

--- Comment #5 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-20 11:26:59 UTC ---
(In reply to comment #3)
> Can you repost your new .config and confirm that you did a complete "make
> clean;  make" ?

sure can.
It's more like:
make clean
make uclibc-menuconfig (to switch on the c99 floating-point support)
make

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
