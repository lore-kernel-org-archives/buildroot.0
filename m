From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Dec 2011 09:19:10 +0000 (UTC)
Subject: [Buildroot] [Bug 4592] libXfont and libXft building failed,
 cross-compilation error
In-Reply-To: <bug-4592-163@https.bugs.busybox.net/>
References: <bug-4592-163@https.bugs.busybox.net/>
Message-ID: <20111212091910.471F98F930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4592

--- Comment #6 from Mario <marioabajo@gmail.com> 2011-12-12 09:19:10 UTC ---
Hello,
I was getting similar errors with other packages and i start investigating in
other direction when i found the LD_LIBRARY_PATH pointing at /usr/lib .
Pointing that env variable to
/home/turin/proyectos/mini2440/buildroot/buildroot-2011.11/output/host/usr/lib
made the building process without errors. My computer is still compilling, so
when it finish y will try to restart the building with a clean LD_LIBRARY_PATH
variable to see if this was the problem.
Thanks :)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
