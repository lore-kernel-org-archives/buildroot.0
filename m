From: bifferos <bifferos@yahoo.co.uk>
Date: Fri, 16 Mar 2012 01:58:42 +0000
Subject: [Buildroot] Debugging /sbin/init startup issues
In-Reply-To: <4F5D5017.2080908@yahoo.co.uk>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
 <4F5D5017.2080908@yahoo.co.uk>
Message-ID: <4F629E52.2070608@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have the following error in init:

init[1]: segfault at 0 ip   (null) sp bf95bf40 error 4 in 
busybox[8048000+7c000]
Kernel panic - not syncing: Attempted to kill init!

How do I debug this?  Does it mean the busybox binary can't be 
executed?  Do I try to tackle this from kernel hacking or can I do it 
from inside busybox?

thanks,
Biff.
