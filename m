From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  8 Sep 2010 09:33:47 +0000 (UTC)
Subject: [Buildroot] [Bug 2461] wireless_tools: install shared library if
	needed
In-Reply-To: <bug-2461-163@https.bugs.busybox.net/>
References: <bug-2461-163@https.bugs.busybox.net/>
Message-ID: <20100908093347.D6BB38A53A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2461

--- Comment #2 from Simon Pasch <fpasch@googlemail.com>  ---
We're checking the interface state with iw_get_basic_config()...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
