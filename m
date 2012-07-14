From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Jul 2012 08:10:08 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120714081008.2082D90B8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #3 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-14 08:10:07 UTC ---
(In reply to comment #1)
> Can you attach the last 100-150 lines of the build log?
> 
> What is the version of Python installed on your host machine?

$ python3.1 --version
Python 3.1.2
$ python --version
Python 2.6.5

What version should it be? How can i pass the correct python version to the
build system? Shouldn't you check the python version before doing the build?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
