From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Nov 2016 21:46:16 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-dtKp2xJP77@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
Paul__ on IRC reported the same issue. I spent some time trying to debug it,
but I wasn't able to reproduce with the same users settings.

The only thing that changed in that area is pseudo, as far as I can see.
However, on 2016/11/28, pseudo was already reverted. That said, the .config
file that is attached to this bug says it is from 2016.11-rc2 so I'm not
entirely sure if the revert is already included. Please try again with
2016.11-rc3 - if it does work there, then we have identified the culprit.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
