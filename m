From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Mar 2015 15:37:47 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] mkuser script fails with: user already
 exists with group nogroup
In-Reply-To: <bug-7976-163@https.bugs.busybox.net/>
References: <bug-7976-163@https.bugs.busybox.net/>
Message-ID: <20150329153747.5C4D580E3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

--- Comment #7 from Tom Elliott <tommygunsster@gmail.com> 2015-03-29 15:37:47 UTC ---
So while the patch is great to lead us to find the cause of the problem (in our
case it looks like it's the openssh package I have building with it) is there
anything I should look into further to help troubleshoot why this, seemingly,
small issue is occurring and the first place?

Is there also anything wrong with commenting the fail part of this so the
rootfs file can actually be built?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
