From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Sep 2016 14:40:18 +0000
Subject: [Buildroot] [Bug 9216] log4cpp package build fails to build within
	install
In-Reply-To: <bug-9216-163@https.bugs.busybox.net/>
References: <bug-9216-163@https.bugs.busybox.net/>
Message-ID: <bug-9216-163-Z2Xafz34bJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9216

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This problem has already been fixed in commit
https://git.buildroot.org/buildroot/commit/package/log4cpp?id=bf20a49d4c2f064015b4d437a7cd98c6dd8ce4ff,
which is part of Buildroot since 2016.08. This commit disables the build of the
documentation, since Buildroot generally doesn't build the documentation of its
packages.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
