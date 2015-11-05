From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Nov 2015 22:50:25 +0000 (UTC)
Subject: [Buildroot] [Bug 8446] rpi-userland failed to build with glibc 2.22
In-Reply-To: <bug-8446-163@https.bugs.busybox.net/>
References: <bug-8446-163@https.bugs.busybox.net/>
Message-ID: <20151105225025.CCA6D7F94D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8446

--- Comment #2 from gamadril.dev at gmail.com 2015-11-05 22:50:21 UTC ---
Hello,

sure, however I don't really know how to do it. I tried to change the
RPI_USERLAND_VERSION in rpi-userland.mk to the git commit with the fix in the
repo on github, but as I could see on the console the build script tries to get
it from http://sources.buildroot.net/rpi-userland-COMMIT_HASH.tar.gz and that
particular code state is not present there.


regards,
Daniel

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
