From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Sep 2018 16:23:44 +0000
Subject: [Buildroot] [Bug 11346] qt5base-5.11.1 Assertion failed: ret == 0
 after getentropy() inside fillBuffer() on arm
In-Reply-To: <bug-11346-163@https.bugs.busybox.net/>
References: <bug-11346-163@https.bugs.busybox.net/>
Message-ID: <bug-11346-163-NLXAJg49Bt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

--- Comment #2 from Philipp Richter <richterphilipp.pops@gmail.com> ---
(In reply to Peter Seiderer from comment #1)

Ah yes that might well be the case, thanks. I'm stuck with 3.10.107 on my
odroid-c1 unfortunately.
I need to do some more testing but what I know right now is that with
qt5base-5.6 LTS it starts correctly.
I'll also try the config with only arch changes on my raspberry pi which has a
much newer kernel.
qt5 seems a bit frustrating on some archs haha

-- 
You are receiving this mail because:
You are on the CC list for the bug.
