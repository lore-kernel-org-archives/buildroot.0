From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  1 Apr 2012 06:41:38 +0000 (UTC)
Subject: [Buildroot] [Bug 5006] make performs library lookup in the build
 and host library directores and not in the staging area
In-Reply-To: <bug-5006-163@https.bugs.busybox.net/>
References: <bug-5006-163@https.bugs.busybox.net/>
Message-ID: <20120401064138.B189B969BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5006

--- Comment #1 from Christoph Schulz <develop@kristov.de> 2012-04-01 06:41:38 UTC ---
Created attachment 4214
  --> https://bugs.busybox.net/attachment.cgi?id=4214
patches make.mk to replace @LIBDIR@ and @USRLIBDIR@

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
