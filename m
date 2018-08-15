From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Aug 2018 11:38:52 +0000
Subject: [Buildroot] [Bug 10996] bogus musl ARM toolchain
In-Reply-To: <bug-10996-163@https.bugs.busybox.net/>
References: <bug-10996-163@https.bugs.busybox.net/>
Message-ID: <bug-10996-163-9vFt2VJNRg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Arnout Vandecappelle from comment #5)
True, but what do you want to do about this, other than fixing each package?
You want to include -static in the toolchain wrapper?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
