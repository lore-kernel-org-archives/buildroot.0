From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Dec 2016 17:10:45 +0000
Subject: [Buildroot] [Bug 9461] toolchain Linaro AArch64 2016.11 compile
	error
In-Reply-To: <bug-9461-163@https.bugs.busybox.net/>
References: <bug-9461-163@https.bugs.busybox.net/>
Message-ID: <bug-9461-163-4DR8Q3WBDE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9461

--- Comment #3 from romain.naour at gmail.com ---
You can't without reverting this patch [1].
The version selection for preconfigured external toolchains removed in 2016.02
release [2].

For a long term fix, the odroid kernel must be patched.

[1]
https://git.buildroot.net/buildroot/commit/?id=cacfea6c263cfbfc450256b25f71dde29fa03f3b
[2] http://lists.busybox.net/pipermail/buildroot/2016-March/154535.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
