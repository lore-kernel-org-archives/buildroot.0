From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 Mar 2017 16:03:15 +0000
Subject: [Buildroot] [Bug 9691] Wrong cryptsetup package include files
	location
In-Reply-To: <bug-9691-163@https.bugs.busybox.net/>
References: <bug-9691-163@https.bugs.busybox.net/>
Message-ID: <bug-9691-163-ZRNTudQCEi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9691

--- Comment #3 from Jean-pierre Cartal <jpcartal@free.fr> ---
Thanks for your quick answer.

Adding CRYPTSETUP_INSTALL_STAGING = YES does indeed solves the issue

Regarding which package would use this header, it's an internal C package that
uses libcryptsetup to mount encrypted partitions. I thought it might be of
interest for others, but if you think that this is a corner case, I'll
understand.

Regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
