From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 May 2013 20:46:53 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130527204653.9D2189A5CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-27 20:45:48 UTC ---
I had a look at this before replying, and the build I tested have been done on
a machine where the zlib development files are not installed. host-erlang
automatically detects that zlib is not available, and builds its own copy of
it. So I concluded that this could not have been the origin of the bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
