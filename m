From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Sep 2019 18:49:06 +0000
Subject: [Buildroot] [Bug 12171] Python-opencv needs config.py and
 config-3.7.py to run. Only the *.pyc is not enough.
In-Reply-To: <bug-12171-163@https.bugs.busybox.net/>
References: <bug-12171-163@https.bugs.busybox.net/>
Message-ID: <bug-12171-163-0AIuDiz2sw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12171

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
I sent a patch to "fix" this issue: https://patchwork.ozlabs.org/patch/1158640.

This patch adds a !BR2_PACKAGE_PYTHON_PYC_ONLY dependency on opencv3's python
option.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
