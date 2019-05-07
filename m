From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 May 2019 14:59:05 +0000
Subject: [Buildroot] [Bug 11831] python-pyparsing: "No module named
 'pyparsing'" on target / while building cantools
In-Reply-To: <bug-11831-163@https.bugs.busybox.net/>
References: <bug-11831-163@https.bugs.busybox.net/>
Message-ID: <bug-11831-163-eph6iJKquQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11831

--- Comment #7 from Tibor Stolz <tistolz@outlook.de> ---
Created attachment 8026
  --> https://bugs.busybox.net/attachment.cgi?id=8026&action=edit
python_ok_bbb_defconfig

I'm sorry I cannot repeat the problem anymore. Using exactly the same buildroot
version and menu settings (except "System hostname" and "System banner"), I get
packages python-pyparsing and python-spidev that work fine and can be imported
into a python3 session without any issue.

For your reference, I'm attaching the main config file, created using "make
savedefconfig".

I'm closing the bug until I hit that behaviour again. (I hope not...)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
