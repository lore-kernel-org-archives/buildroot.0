From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2014 15:12:54 +0000 (UTC)
Subject: [Buildroot] [Bug 6776] systemd error: static declaration of
 'execvpe' follows non-static declaration (uClibc)
In-Reply-To: <bug-6776-163@https.bugs.busybox.net/>
References: <bug-6776-163@https.bugs.busybox.net/>
Message-ID: <20140213151254.12F0E9C9AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6776

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-13 15:12:53 UTC ---
(In reply to comment #2)
> In the upcoming systemd patches by Eric Le Bihan, systemd is no longer
> available for uClibc, following an upstream viewpoint.
> 
> So, when these patches are merged, this bug can be closed.

Nevermind: this apparently was already overthought by Thomas Petazzoni. The
reasoning is to apply his patch in 2014.02, still, knowing that Eric's patches
will be in 2014.05 only.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
