From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Oct 2018 16:11:24 +0000
Subject: [Buildroot] [Bug 11401] Impossible do build a qt program using
 kf5-networkmanager-qt with qmake
In-Reply-To: <bug-11401-163@https.bugs.busybox.net/>
References: <bug-11401-163@https.bugs.busybox.net/>
Message-ID: <bug-11401-163-ByIEpDkvAQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11401

--- Comment #11 from Pierre Ducroquet <pinaraf@pinaraf.info> ---
After analysis and some checks (thanks Nicolas for your availability on IRC) it
looks like there are two issues:
- a bug in extra-cmake-modules that generates invalid pri when cross-building
- wrong cmake settings on my side, thus putting files in wrong places

I am still working on it and confident a solution will be found by tomorrow.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
