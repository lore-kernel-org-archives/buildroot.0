From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 29 May 2010 19:31:38 +0000 (UTC)
Subject: [Buildroot] [Bug 1789] binutils fails to build for i386
In-Reply-To: <bug-1789-163@https.bugs.busybox.net/>
References: <bug-1789-163@https.bugs.busybox.net/>
Message-ID: <20100529193138.4BB9299A72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1789

--- Comment #4 from Thomas <tokant@gmx.net>  ---
for me, removing the line 

   HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib

leads to a successful build too, otherwise I have the same problems as
described in this bug report. Tested with buildroot 2010.05rc3.

My host system is Ubuntu 8.04/32-bit. Target AT91RM9200.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
