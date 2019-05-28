From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 May 2019 17:32:21 +0000
Subject: [Buildroot] [Bug 11911] systemd v240 memory leak in
 systemd-journald (buildroot 2019.02 LTS affected)
In-Reply-To: <bug-11911-163@https.bugs.busybox.net/>
References: <bug-11911-163@https.bugs.busybox.net/>
Message-ID: <bug-11911-163-5m7JZVPY8s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11911

--- Comment #4 from Jonah <jonah@sense.com> ---
Thanks, I submitted a patch to the list covering the addition of commit
2d5d2e0cc5 in addition to eb1ec489ee.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
