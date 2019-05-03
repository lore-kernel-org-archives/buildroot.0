From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 12:19:58 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-MuWGZSniCN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #5 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Pete Morici from comment #3)

It would be possible to have a util-linux-libs package providing libblkid and a
util-linux package with the utilities, only. Another solution would be doing
the same as Fedora, on which libeudev is provided by a systemd-libs package on
which util-linux depends.

I will investigate both solutions and post the results as soon as possible.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
