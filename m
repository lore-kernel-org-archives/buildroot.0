From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Nov 2010 21:44:08 +0000 (UTC)
Subject: [Buildroot] [Bug 2839] compile fails in various packages with a odd
 message "error: impossible constraint in 'asm'"
In-Reply-To: <bug-2839-163@https.bugs.busybox.net/>
References: <bug-2839-163@https.bugs.busybox.net/>
Message-ID: <20101117214408.0CD1F8E97E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2839

--- Comment #1 from S?rgio <sergio@sergiomb.no-ip.org>  ---
Created attachment 2683
  --> https://bugs.busybox.net/attachment.cgi?id=2683
dot config of this case

after compile gcc or on first error :
edit 
/home/sergio/hardware/moviecube/buildroot/output/staging/usr/include/bits/wordsize.h

and change _MIPS_SZPTR by 32 
which is the correct value.

BTW I Had compile all this with buildroot-2010.08

Thanks,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
