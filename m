From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 03 Dec 2019 21:35:57 +0000
Subject: [Buildroot] [Bug 12376] python-scapy3k is deprecated
In-Reply-To: <bug-12376-163@https.bugs.busybox.net/>
References: <bug-12376-163@https.bugs.busybox.net/>
Message-ID: <bug-12376-163-cQ1ulE25Xb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12376

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Thanks for this report. Feel free to send a patch to the mailing list to remove
python-scapy3k. Make sure to also include legacy handling (i.e. move the option
to Config.in.legacy and select BR2_PACKAGE_PYTHON_SCAPY from it).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
