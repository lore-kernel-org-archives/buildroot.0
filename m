From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Aug 2020 22:20:16 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-MX6PayYZxL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

--- Comment #1 from Christian Stewart <christian@paral.in> ---
According to this, originally the submitter tried to disable the warning, but
that patch was rejected by the maintainers:


http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-1-package-python-rpi-gpio-fix-build-with-gcc-10-x-td261727.html

Then they submitted another with the more deep changes, I wonder, what was so
bad about disabling the compiler warning?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
