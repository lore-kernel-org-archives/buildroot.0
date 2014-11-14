From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Nov 2014 08:25:38 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20141114082538.6D799AE30A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-14 08:25:37 UTC ---
Thanks for your feedback. Interesting, it clearly doesn't match what I'm seeing
here. Can you post to some pastebin site or some other location the complete
build log? Something like:

  make 2>&1 | tee logfile

And then post 'logfile' somewhere. It would be even nicer if you could after
the build do:

  find output/target/ | tee -a logfile

So that I can also see the full list of files in your target filesystem. I
indeed think something in your host system might be causing the problem, we
need to figure out what.

Thanks again!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
