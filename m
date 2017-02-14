From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Feb 2017 09:43:17 +0000
Subject: [Buildroot] [Bug 9651] libxcb-1.12 built Error
In-Reply-To: <bug-9651-163@https.bugs.busybox.net/>
References: <bug-9651-163@https.bugs.busybox.net/>
Message-ID: <bug-9651-163-u2XvSoVATn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9651

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
So there is in fact no build issue with libxcb, correct? If that's the case,
then it would be better to close this bug, and re-open a new one so that things
are clear.

Are you starting the build with just a plain "make", or using "make
-j<somenumber>" ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
