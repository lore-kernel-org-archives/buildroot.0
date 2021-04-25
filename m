From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Apr 2021 07:45:59 +0000
Subject: [Buildroot] [Bug 13741] genext2fs does not allow to set perms of
 root node
In-Reply-To: <bug-13741-163@https.bugs.busybox.net/>
References: <bug-13741-163@https.bugs.busybox.net/>
Message-ID: <bug-13741-163-jME7LsZf9q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13741

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed for 2021.02.x in:
https://git.buildroot.net/buildroot/commit/?h=2021.02.x&id=a4822f31ca985192595cf04246e4d6c1f88f168f

-- 
You are receiving this mail because:
You are on the CC list for the bug.
