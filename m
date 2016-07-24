From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Jul 2016 20:46:59 +0000
Subject: [Buildroot] [Bug 9021] Kodi - Broken: Illegal instruction (core
	dumped)
In-Reply-To: <bug-9021-163@https.bugs.busybox.net/>
References: <bug-9021-163@https.bugs.busybox.net/>
Message-ID: <bug-9021-163-8Meq7nki2P@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9021

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Can you try to build with BR2_PACKAGE_PYTHON_PY_PYC=y instead of
BR2_PACKAGE_PYTHON_PYC_ONLY=y and see if it makes a difference?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
