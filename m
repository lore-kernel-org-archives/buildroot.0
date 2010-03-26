From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 13:35:06 +0000 (UTC)
Subject: [Buildroot] [Bug 1327] mtd-utils compile failure due to lack of
 --sysroot in CFLAGS
In-Reply-To: <bug-1327-163@https.bugs.busybox.net/>
References: <bug-1327-163@https.bugs.busybox.net/>
Message-ID: <20100326133506.115778B6CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1327





--- Comment #2 from Grant Edwards <grant.b.edwards@gmail.com>  2010-03-26 13:35:05 UTC ---
It looks like my patch was a week late.  This commit should fix the
problem:

 
http://git.buildroot.net/buildroot/commit/?id=d5bf5f967009733da99c55febacb3fb0be686cad

I'll pull the new mtd.mk file and try it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
