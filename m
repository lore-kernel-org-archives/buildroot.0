From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 10:36:00 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100624103600.0BD0181975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Mitch, with the merge of the linux-cleanup work, the module-init-tools package
has been upgraded and migrated to the autotools infrastructure. So it is
possible that the problem you're seeing has been fixed.

Can you give a try at the latest Buildroot git ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
