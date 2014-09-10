From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Sep 2014 18:27:19 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20140910182719.A7F0A9D651@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-09-10 18:27:19 UTC ---
See http://buildroot.org/downloads/manual/manual.html#reporting-bugs. If you
don't provide your Buildroot .config file, there's no way for us to understand
what configuration you are building, and no way to reproduce your build.

Also, could you make sure to restart the build from scratch by doing "make
clean; make". Your report very much looks like a change in the toolchain
configuration, without doing a full rebuild. See
http://buildroot.org/downloads/manual/manual.html#full-rebuild.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
