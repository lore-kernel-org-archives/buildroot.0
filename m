From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 May 2013 20:43:42 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130527204342.E9AC19A5CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #6 from Arnout Vandecappelle <arnout@mind.be> 2013-05-27 20:42:37 UTC ---
Looks to me like host-erlang should either depend on host-zlib, or set the
--disable-shared-zlib option.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
