From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Feb 2011 13:32:46 +0000 (UTC)
Subject: [Buildroot] [Bug 3331] xdata_xcursor-themes depends on xcursorgen
In-Reply-To: <bug-3331-163@https.bugs.busybox.net/>
References: <bug-3331-163@https.bugs.busybox.net/>
Message-ID: <20110224133246.D761D8F751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3331

--- Comment #1 from Bart?omiej Palmowski <rotwang@crux.org.pl>  ---
other thing is that installed xcursorgen is not placed in PATH so configure
can't find it, PATH in configure env is:
/mnt/usb/repos/buildroot/output/host/bin:/mnt/usb/repos/buildroot/output/host/usr/bin:/mnt/usb/repos/buildroot/output/host/usr/sbin/:/bin:/usr/bin:/opt/bin:/opt/bin:/opt/bin
and xcursorgen is located in /mnt/usb/repos/buildroot/output/target/usr/bin/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
