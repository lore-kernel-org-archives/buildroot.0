From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Mar 2020 11:09:38 +0000
Subject: [Buildroot] [Bug 12631] glibc support Power-PC SPE
In-Reply-To: <bug-12631-163@https.bugs.busybox.net/>
References: <bug-12631-163@https.bugs.busybox.net/>
Message-ID: <bug-12631-163-vH8IECu7C7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12631

--- Comment #1 from romain.naour at gmail.com ---
Hi,

I would recommend to build your toolchain using Buildroot 2019.02.x using the
internal toolchain backend and import the toolchain in Buildroot 2020.02 using
the external toolchain backend.

See "6.1.3. Build an external toolchain with Buildroot"
http://nightly.buildroot.org/manual.html#_cross_compilation_toolchain

But Buildroot doesn't support powerpc-spe since [1] (2014-05-30)

[1]
https://git.buildroot.net/buildroot/commit/?id=5777e3ffd99132a57e3d29659850eec14b1625f8

Note: The powerpc spe has been removed recently from gcc 9 and glibc 2.30.

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
