From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Aug 2015 19:43:18 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150813194318.820D881ECF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #7 from CB <christophebricout@yahoo.fr> 2015-08-13 19:43:17 UTC ---
Created attachment 6136
  --> https://bugs.busybox.net/attachment.cgi?id=6136
configuration execution issue within grub2-2.00 directory

Updating PATH variable before running 'make'.
The compilation go further but an error is still occuring.
configure:4778: error: in `<...>/buildroot-2015.05/output/build/grub2-2.00'

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
