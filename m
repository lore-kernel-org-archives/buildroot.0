From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Feb 2013 15:53:43 +0000 (UTC)
Subject: [Buildroot] [Bug 5966] bison unnecessarily required as build
	dependency
In-Reply-To: <bug-5966-163@https.bugs.busybox.net/>
References: <bug-5966-163@https.bugs.busybox.net/>
Message-ID: <20130225155343.257569AD3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5966

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-02-25 15:54:06 UTC ---
I agree, but I think bison on the host might be needed for the internal
toolchain backend, while building binutils/gcc/gdb. We would need to check
that, and add the needed dependency on host-bison where needed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
