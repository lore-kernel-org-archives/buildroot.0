From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Oct 2011 13:43:09 +0000 (UTC)
Subject: [Buildroot] [Bug 4387] Make sure that dest dir exists before
 installing mtd files
In-Reply-To: <bug-4387-163@https.bugs.busybox.net/>
References: <bug-4387-163@https.bugs.busybox.net/>
Message-ID: <20111031134309.7359B8F3BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4387

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2011-10-31 13:43:08 UTC ---
Instead, the patch should change the call to install to use the -D option.
Could you submit a proper patch to the Buildroot mailing list?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
