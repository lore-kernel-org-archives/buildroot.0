From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Mar 2017 15:33:13 +0000
Subject: [Buildroot] [Bug 9711] Recent libCEC version bump seems to break
	kodi package
In-Reply-To: <bug-9711-163@https.bugs.busybox.net/>
References: <bug-9711-163@https.bugs.busybox.net/>
Message-ID: <bug-9711-163-3St1j6hcjr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9711

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Could you indicate which error you get after a complete build from scratch, i.e
"make clean all" ?

Are you sure you follow exactly the steps you indicate? They look good, but if
you do a slightly different variation, then it might be wrong. Please always do
a full build, i.e "make clean all" if you want to be sure.

Results of partial builds are not guaranteed to be correct if you change the
configuration or packages. You really have to know what you're doing to
properly use partial builds.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
