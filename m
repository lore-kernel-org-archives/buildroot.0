From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 Mar 2017 15:53:24 +0000
Subject: [Buildroot] [Bug 9691] Wrong cryptsetup package include files
	location
In-Reply-To: <bug-9691-163@https.bugs.busybox.net/>
References: <bug-9691-163@https.bugs.busybox.net/>
Message-ID: <bug-9691-163-Fg1Is6kliq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9691

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We just need to add CRYPTSETUP_INSTALL_STAGING = YES in cryptsetup.mk.

Just curious, what other package might use this header file provided by
crypsetup?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
