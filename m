From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Aug 2015 16:29:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8281] pyrexc fails to run when path is too long
In-Reply-To: <bug-8281-163@https.bugs.busybox.net/>
References: <bug-8281-163@https.bugs.busybox.net/>
Message-ID: <20150827162904.B7F1481EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8281

--- Comment #2 from kevin.alden2 at gmail.com 2015-08-27 16:29:04 UTC ---
(In reply to comment #1)
> Isn't this a pyrexc bug rather than a Buildroot bug?

I suppose you could look at it that way.  I don't know enough about pyrexc to
propose a solution, but Buildroot must be populating that invalid shebang.  I
guess I would look at it as a Buildroot bug for that reason.  

I would consider it a pyrexc bug as well if it happens to be completely reliant
on the shebang to work.  It seems like you could just explicitly pass pyrexc to
python and avoid the shebang issue though.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
