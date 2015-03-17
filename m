From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Mar 2015 21:47:38 +0000 (UTC)
Subject: [Buildroot] [Bug 7941] glibc-2.20 fails to build for
	sparc-buildroot-linux-gnu
In-Reply-To: <bug-7941-163@https.bugs.busybox.net/>
References: <bug-7941-163@https.bugs.busybox.net/>
Message-ID: <20150317214738.471CA81827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7941

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2015-03-17 21:47:38 UTC ---
Thanks for the headsup, just sent a patch to the list to disable 2.20 for sparc
which leaves 2.21 (tested working with qemu).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
