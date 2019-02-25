From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Feb 2019 16:51:14 +0000
Subject: [Buildroot] [Bug 9966] util-linux-2.30/.stamp_built' failed
In-Reply-To: <bug-9966-163@https.bugs.busybox.net/>
References: <bug-9966-163@https.bugs.busybox.net/>
Message-ID: <bug-9966-163-zenRdDIJr2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9966

--- Comment #8 from Carlos Santos <casantos@datacom.com.br> ---
(In reply to Micha? Miros?aw from comment #7)

Let me clarify my point: I'm not against adding a patch to disable rtcwake,
even though I believe this should be submitted upstream first. My point is that
such change would be an improvement, not a bug fix, so the right way to do it
is by means of a patch on Buildroot that adds the required patch for util-linux
and also turns AUTORECONF to YES.

Also, this discussion should happen on the buildroot mailing list, not on a bug
report, so I stop here.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
