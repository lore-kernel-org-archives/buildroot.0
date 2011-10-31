From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Oct 2011 14:05:30 +0000 (UTC)
Subject: [Buildroot] [Bug 4429] buildroot 2011.08 does not build on Ubuntu
	11.10
In-Reply-To: <bug-4429-163@https.bugs.busybox.net/>
References: <bug-4429-163@https.bugs.busybox.net/>
Message-ID: <20111031140530.94A078F3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4429

--- Comment #3 from Robert Berger <busybox@reliableembeddedsystems.com> 2011-10-31 14:05:30 UTC ---
When I'm __not__ running screen or byubo, but, just ssh to a machine:

echo $SHELL
/bin/bash

it compiles.

---------------------------

When I'm running byubo (and bash)

echo $SHELL
/bin/bash

it breaks with the funny errors from above.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
