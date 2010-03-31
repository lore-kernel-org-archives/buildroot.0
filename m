From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 09:52:40 +0000 (UTC)
Subject: [Buildroot] [Bug 1387] xlib_libX11-1.3.2 can's find libjpeg
In-Reply-To: <bug-1387-163@https.bugs.busybox.net/>
References: <bug-1387-163@https.bugs.busybox.net/>
Message-ID: <20100331095240.DAF1C23480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1387





--- Comment #4 from Paul Jones <paul.jones@iwtech.com.au>  2010-03-31 09:52:40 UTC ---
> 
> What package needed ps2pdf? Perhaps we can disable the doc build.

xlib_libX11

I just uninstalled ghostscript and tried it again and it automatically skiped
the ps2pdf step, so it appears it will only try and use it if it is already on
the host system.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
