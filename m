From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Nov 2014 17:46:19 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20141120174619.F28407FD89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

--- Comment #8 from tobias.meggendorfer+buildroot at gmail.com 2014-11-20 17:46:19 UTC ---
Update: I just setup a new virtual machine (3.13.0-32-generic, Ubuntu 14.04 LTS
Server), and apparently there the SSL module gets built and I can run "import
ssl" without a problem.

The used config differs from the one I uploaded but it didn't work with this
particular one on my original system, too.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
