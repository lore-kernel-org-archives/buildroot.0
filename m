From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  1 Apr 2015 19:25:09 +0000 (UTC)
Subject: [Buildroot] [Bug 7981] Target file system skeleton permissions
	hazard
In-Reply-To: <bug-7981-163@https.bugs.busybox.net/>
References: <bug-7981-163@https.bugs.busybox.net/>
Message-ID: <20150401192509.9BE858190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7981

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> 2015-04-01 19:25:09 UTC ---
This is a known issue, and a patch series was posted a while ago that should
fix it. Could you try it out? If it works out, please add your Tested-by: tag
to the series.

For your convenience, I've created a patchwork bundle of this series:
http://patchwork.ozlabs.org/bundle/arnout/umask%20handling/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
