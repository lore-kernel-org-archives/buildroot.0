From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Sep 2020 13:11:40 +0000
Subject: [Buildroot] [Bug 13186] nvidia driver fail to build with 5.6 kernel
In-Reply-To: <bug-13186-163@https.bugs.busybox.net/>
References: <bug-13186-163@https.bugs.busybox.net/>
Message-ID: <bug-13186-163-3AnOgiEI0E@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13186

--- Comment #1 from Vincent Fazio <vfazio@xes-inc.com> ---
(In reply to Dr I J Ormshaw from comment #0)

Note that we do have pending patches for this driver:

A simple bump to 390.132 should work for 5.6

http://patchwork.ozlabs.org/project/buildroot/list/?series=159815 (should be
bumped to 390.138 for additional fixes)

https://download.nvidia.com/XFree86/Linux-x86_64/390.138/README/index.html


There is also a series to bump to the 4xx driver branch but needs some work

http://patchwork.ozlabs.org/project/buildroot/list/?series=176379&state=*

So it's on the list of "things to do"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
