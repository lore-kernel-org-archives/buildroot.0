From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Apr 2015 15:26:44 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150402152644.ADE4C81964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #13 from Jinho Yoo <brotherjinho@gmail.com> 2015-04-02 15:26:44 UTC ---
Dear Everybody. 

 I found the reason. The CPU on target board doesn't have floating point
calculation unit. I got this information from our H/W partner. I'm very sorry
to make you guys confuse. 

 Regards, 
Jinho Yoo

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
