From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 09 May 2020 11:06:06 +0000
Subject: [Buildroot] [Bug 12871] QT5.14 Missing module Timeline
In-Reply-To: <bug-12871-163@https.bugs.busybox.net/>
References: <bug-12871-163@https.bugs.busybox.net/>
Message-ID: <bug-12871-163-yzJXavTco3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12871

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
For suggested patch see [1] (to late for 2020.05 as rc1 - fixes only - is
already released, your have to apply the patch yourself (*) or use git branch
next (after the patch is accepted by the maintainers)...

Note, qtquicktimeline is GPL only (not LGPL)...

(*) preferred, plus your feedback if it works for you ;-)

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20200509105730.13490-1-ps.report at gmx.net/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
