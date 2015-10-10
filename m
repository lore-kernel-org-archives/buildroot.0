From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Oct 2015 00:26:53 +0000 (UTC)
Subject: [Buildroot] [Bug 8391] Node.js 0.12.7 fails to build on
	raspberry_pi defconfig
In-Reply-To: <bug-8391-163@https.bugs.busybox.net/>
References: <bug-8391-163@https.bugs.busybox.net/>
Message-ID: <20151010002653.9DE1081EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8391

--- Comment #2 from Tomas Pollak <tomaspollak@gmail.com> 2015-10-10 00:26:53 UTC ---
Thanks for the heads Peter.

Now, given that the compiler _is_ able to build the package just by setting
-march=armv6, wouldn't it be easier to simply include that parameter in the
configure options instead of modifying the source code itself?

Thanks again

PS. I'll also take a shot at building node v4.1.2 and see if it works. There's
a lot of new stuff in there so I'll keep my fingers crossed. :)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
