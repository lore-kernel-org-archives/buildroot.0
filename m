From: AAlex_ <earthquake.de@freenet.de>
Date: Fri, 16 Feb 2018 00:51:26 -0700 (MST)
Subject: [Buildroot] Inconsistency detected by ld.so while booting
In-Reply-To: <1518699653540-0.post@n4.nabble.com>
References: <1518699653540-0.post@n4.nabble.com>
Message-ID: <1518767486516-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 
now I have more information.
The error when booting appears since the toolchain option was switched from
uclibc-ng to glibc.
But the behaviour is still the same, building within the vm successfull and
boot the image successfull.
Building the same buildroot-tree within the dev-systestem is successfull but
booting leads to the error descripbed below following by kernel-panic.

Best regards,
Alex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
