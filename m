From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Oct 2013 10:46:23 +0000 (UTC)
Subject: [Buildroot] [Bug 6650] Segmentation fault when trying to build
	latest buildroot
In-Reply-To: <bug-6650-163@https.bugs.busybox.net/>
References: <bug-6650-163@https.bugs.busybox.net/>
Message-ID: <20131031104624.10AE49BC02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6650

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-31 10:46:23 UTC ---
As you can see in http://git.buildroot.net/buildroot/tree/configs, we don't
have a sama5d3ekdemo_defconfig in the mainline Buildroot.

Are you sure you are using the mainline Buildroot version? We unfortunately
cannot support the numerous Buildroot forks that are made by various
people/organizations.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
