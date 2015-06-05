From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Jun 2015 16:16:56 +0000 (UTC)
Subject: [Buildroot] [Bug 8036] alsa-lib headers problem that prevents to
 compile alsa dependent projects
In-Reply-To: <bug-8036-163@https.bugs.busybox.net/>
References: <bug-8036-163@https.bugs.busybox.net/>
Message-ID: <20150605161656.6D96B81E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8036

--- Comment #13 from Juan <jrmcorreo-linux@yahoo.es> 2015-06-05 16:16:56 UTC ---
As you said, at last it worked fine. I can only say that now it works and
before not. I think the problem was related about make clean command, that
didn't cleaned properly the compile environment.

The first time I compiled alsa was in order to compile openjdk, and I've
applied both at once. This time I've compiled first buildroot with alsa, then I
added openjdk after.

Sincerely, I thought that it was a bug because after applying a make clean
command and try to compile only alsa didn't worked fine, but finally it
worked... and worked without removing competely the buildroot environment I'm
using since the begining.

If you can't reproduce it and don't consider it as a bug, then is not a bug and
probably was caused after introducing a new package not in the
official/mainstream release.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
