From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Nov 2014 07:28:23 +0000 (UTC)
Subject: [Buildroot] [Bug 7592] Buildroot GCC: -lto requires plugin support
	in ranlib
In-Reply-To: <bug-7592-163@https.bugs.busybox.net/>
References: <bug-7592-163@https.bugs.busybox.net/>
Message-ID: <20141107072823.42973B05FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7592

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-07 07:28:23 UTC ---
We don't have LTO support right now in Buildroot. There is a patch adding LTO
support (see http://patchwork.ozlabs.org/patch/362034/), but we not entirely
happy with it yet, so it hasn't been applied. Feel free to test it and report
back: some feedback on the patch would be very useful.

So, I'm tempted to classify this bug not as a bug, but as a feature request.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
