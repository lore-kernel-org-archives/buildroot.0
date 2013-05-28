From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 May 2013 19:39:48 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130528193948.37B8B9A61F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #8 from Arnout Vandecappelle <arnout@mind.be> 2013-05-28 19:38:28 UTC ---
Hm, indeed --enable-shared-zlib defaults to no, so that can't be it.

I also haven't been able to reproduce.

Timofei, can you attach the failing .config?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
