From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Aug 2010 19:15:56 +0000 (UTC)
Subject: [Buildroot] [Bug 2401] sysvinit-2.86 fails to build on MIPS because
 is missing -lcrypt
In-Reply-To: <bug-2401-163@https.bugs.busybox.net/>
References: <bug-2401-163@https.bugs.busybox.net/>
Message-ID: <20100811191556.C8C028740B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2401

--- Comment #1 from S?rgio <sergio@sergiomb.no-ip.org>  ---
Created attachment 2335
  --> https://bugs.busybox.net/attachment.cgi?id=2335
fix problem on 64-bits host

Hi, with this patch , I could compile successfully  sysvinit-2.86

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
