From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 May 2020 15:47:16 +0000
Subject: [Buildroot] [Bug 12691] host-rust build fails
In-Reply-To: <bug-12691-163@https.bugs.busybox.net/>
References: <bug-12691-163@https.bugs.busybox.net/>
Message-ID: <bug-12691-163-2PsbYHXL8W@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12691

--- Comment #4 from romain.naour at gmail.com ---
Hi Eyal, Alex,

As a short therm solution, I suggested a patch that disable host-rust package
when the target architecture is not supported by rust [1].

I'm not sure how upstream rust project is testing/supporting uClibc-ng or musl.

Note: The current rust version available in Buildroot is old, there is a patch
series adding a Cargo package infrastructure and an update to rust 1.40 (1.43.1
is already available).

Feel free to send a followup patch to enable host-rust for uclibc target.

[1]
http://patchwork.ozlabs.org/project/buildroot/patch/20200508152739.1625844-1-romain.naour at gmail.com/

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
