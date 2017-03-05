From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Mar 2017 15:22:25 +0000
Subject: [Buildroot] [Bug 9711] Recent libCEC version bump seems to break
	kodi package
In-Reply-To: <bug-9711-163@https.bugs.busybox.net/>
References: <bug-9711-163@https.bugs.busybox.net/>
Message-ID: <bug-9711-163-Brmk81AgvT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9711

--- Comment #2 from RiZom-91 <rizom91@openaliasbox.org> ---
Hum... There is something I'm missing with buildroot... Here is what I did.

1) clone the GitHub repo
2) did some minor changes and commit each change to my local repo
3) add kodi, kodi-cec packages, commit
4) make -> error with libCEC
5) revert libCEC version bump
6) make -> ok
7) did some changes in the devices_table_dev.txt
8) rm -Rf the output folder
9) make -> error with libCEC
10) revert the revert commit to get back to the original configuration (and get
the error message by the way)
11) make -> OK now

Could someone explain to me what I did wrong please ? Maybe the 'rm -Rf" part ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
