From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Jun 2021 20:33:32 +0000
Subject: [Buildroot] [Bug 13586] grub failure with BR2_OPTIMIZE_3
In-Reply-To: <bug-13586-163@https.bugs.busybox.net/>
References: <bug-13586-163@https.bugs.busybox.net/>
Message-ID: <bug-13586-163-NqBAmgisp5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13586

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
There is some follow up discussion on the mailing list, see [1], resulting in
suggested patch to force '-Os' for grub compile, see [2]...

[1] http://lists.busybox.net/pipermail/buildroot/2021-May/311524.html
[2] http://lists.busybox.net/pipermail/buildroot/2021-May/311630.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
