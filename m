From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 13:06:39 +0000
Subject: [Buildroot] [Bug 10391] WiringPi retrieves wrong (old) version
In-Reply-To: <bug-10391-163@https.bugs.busybox.net/>
References: <bug-10391-163@https.bugs.busybox.net/>
Message-ID: <bug-10391-163-0gYcqslrz4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
The problem seems to be a wrong tag in the original repository[1],
buildroot checks out the 2.44 tag, same as commit [2], but the
apparent version bump happens one  commit [3] later (and gives
the PiZero-W support)...

But no changes regarding old/new kernels?

Regards,
Peter

[1]https://git.drogon.net/?p=wiringPi;a=summary
[2]
https://git.drogon.net/?p=wiringPi;a=commitdiff;h=e8da87fbaced1edf75a5b37f78e8d4eb5ec0f18d
[3]
https://git.drogon.net/?p=wiringPi;a=commitdiff;h=96344ff7125182989f98d3be8d111952a8f74e15

-- 
You are receiving this mail because:
You are on the CC list for the bug.
