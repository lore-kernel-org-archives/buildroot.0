From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 09 Nov 2018 15:58:51 +0000
Subject: [Buildroot] [Bug 11426] pps-tools bash dependency
In-Reply-To: <bug-11426-163@https.bugs.busybox.net/>
References: <bug-11426-163@https.bugs.busybox.net/>
Message-ID: <bug-11426-163-nBPFFMJTT0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11426

--- Comment #2 from Jan Dohl <jan.dohl@airrays.com> ---
I submitted a patch here: https://github.com/redlab-i/pps-tools/pull/9

The author did some more changes and committed an update to the master branch:
https://github.com/redlab-i/pps-tools/pull/10

Since the pps-tools package in buildroot seems to load directly from a certain
commit on the master branch, should I just update the package to the newest
commit-id and submit a patch? Or is this usually done by the maintainer?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
