From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Jul 2012 07:43:29 +0000 (UTC)
Subject: [Buildroot] [Bug 5408] qt build failure with Sourcery CodeBench ARM
	2010.09
In-Reply-To: <bug-5408-163@https.bugs.busybox.net/>
References: <bug-5408-163@https.bugs.busybox.net/>
Message-ID: <20120728074329.EB22396D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5408

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-28 07:43:29 UTC ---
(In reply to comment #1)
> Should I submit a patch so that BR2_TARGET_OPTIMIZATION defaults to a value
> with this flag when Sourcery 2010.09 is in use? Or just document it in
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009?

Though I fully admit with the goal of ensuring that each and every
configuration that an user can come up with should build, I am not sure adding
this option globally to the build when this toolchain is used is a good idea. I
think in this specific case, I would prefer that we add a "Known issues"
chapter in the documentation, in which we list known problems and their
solutions.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
