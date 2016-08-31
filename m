From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Aug 2016 21:19:08 +0000
Subject: [Buildroot] [Bug 7802] host-python build hangs compiling
	getbuildinfo.o
In-Reply-To: <bug-7802-163@https.bugs.busybox.net/>
References: <bug-7802-163@https.bugs.busybox.net/>
Message-ID: <bug-7802-163-KLDSQyABN3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7802

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I've submitted two patches to fix this:
https://patchwork.ozlabs.org/patch/664681/ and
https://patchwork.ozlabs.org/patch/664680/.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
