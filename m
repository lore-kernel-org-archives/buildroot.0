From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Jan 2020 20:49:00 +0000
Subject: [Buildroot] [Bug 12446] Buildroot fails to finish installing
 packages
In-Reply-To: <bug-12446-163@https.bugs.busybox.net/>
References: <bug-12446-163@https.bugs.busybox.net/>
Message-ID: <bug-12446-163-Z4YAlYxmsT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12446

--- Comment #4 from TheComputerGuy <spaceboyross@gmail.com> ---
The problem exists in the package/pkg-generic.mk file at line 360. I'm using
the commit
https://git.buildroot.net/buildroot/commit/?id=88f79481878c7adf9642e208c72dea7fe367bee8,
look at the commit history for the file I mentioned and I haven't changed it so
this is an upstream issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
