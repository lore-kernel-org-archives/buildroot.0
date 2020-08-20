From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Aug 2020 21:30:06 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-wFvL1fhRPE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

--- Comment #5 from Christian Stewart <christian@paral.in> ---
Thanks Yann. The patch I attached to this bug actually doesn't work anyway, the
module still fails at runtime:

  File "usr/lib/python3.8/site-packages/RPi/GPIO/__init__.py", line 23, in
<module>
SystemError: Type does not define the tp_name field.

Feel free to send me any patch for testing.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
