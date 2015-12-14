From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Dec 2015 15:40:26 +0000
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <bug-8296-163-EYEF20J86B@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

--- Comment #8 from Martin <martin@barkynet.com> ---
I have submitted 2 patches upsteam:

1) https://github.com/nodejs/node/pull/4272 - Fixes the crash in node.js
2) https://github.com/libuv/libuv/pull/653 - Fixes the underlying issues of
uClibc-ng support in libuv

I have tested these patches for node.js 0.12.9, 4.2.3 and 5.2.0 and it fixes
the issues.  I'll submit patches to buildroot tonight.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
