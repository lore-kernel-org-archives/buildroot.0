From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Aug 2010 17:19:37 +0000 (UTC)
Subject: [Buildroot] [Bug 2395] libglib2-2.24.1 and libxml2-2.7.7 fails
 build on MIPS because is missing -ldl
In-Reply-To: <bug-2395-163@https.bugs.busybox.net/>
References: <bug-2395-163@https.bugs.busybox.net/>
Message-ID: <20100817171937.E7D7588D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2395

--- Comment #4 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #3)
> > I reported, just after do a make clean , make clean is that enough ?
> 
> 'make clean' is indeed enough. Please put the full build log online somewhere.
> As I can't reproduce the issue, if you don't provide a full build log so that I
> can start the investigation, 

ok , I will put it don't worry , I am in holidays and this is only a hobby ...
give me 2 days please. 

> I will unfortunately have no other option than
> closing this bug because of missing information.
> 
> You can also try to reproduce by disabling BR2_CONFIG_CACHE (by default it is
> enabled). I'm fairly strongly suspecting a configure cache issue.

ok I will check that.  

thanks,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
