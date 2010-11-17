From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Nov 2010 22:58:08 +0000 (UTC)
Subject: [Buildroot] [Bug 2845] dialog 1.1 needs libtinfo from ncurses
In-Reply-To: <bug-2845-163@https.bugs.busybox.net/>
References: <bug-2845-163@https.bugs.busybox.net/>
Message-ID: <20101117225808.D6A618E97E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2845

--- Comment #1 from S?rgio <sergio@sergiomb.no-ip.org>  ---
Created attachment 2689
  --> https://bugs.busybox.net/attachment.cgi?id=2689
so ncurses should becompile with libtinfo.so

 ncurses normally is compiled with libtinfo , Fedora does ... , bash if have it
use it etc..

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
