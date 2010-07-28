From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jul 2010 14:15:15 +0000 (UTC)
Subject: [Buildroot] [Bug 2131] Add OpenMP support to the toolchain
In-Reply-To: <bug-2131-163@https.bugs.busybox.net/>
References: <bug-2131-163@https.bugs.busybox.net/>
Message-ID: <20100728141515.6C58E83495@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2131

--- Comment #2 from Will Newton <will.newton@gmail.com>  ---
(In reply to comment #1)
> I'm not sure about OpenMP. What would be the use case of this in an embedded
> scenario ?

The actual use this was put into our local tree was to build OpenCV which can
use OpenMP out of the box. It's only really useful on SMP systems but I think
there are quite a few of those around these days.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
