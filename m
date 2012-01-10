From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jan 2012 16:49:30 +0000 (UTC)
Subject: [Buildroot] [Bug 3529] alsa-lib 1.0.24.1 build fails with daily
 snapshot (2011-03-29)
In-Reply-To: <bug-3529-163@https.bugs.busybox.net/>
References: <bug-3529-163@https.bugs.busybox.net/>
Message-ID: <20120110164930.7E3CC902EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3529

--- Comment #7 from Stephane Fillod <fillods@users.sf.net> 2012-01-10 16:49:29 UTC ---
Created attachment 3950
  --> https://bugs.busybox.net/attachment.cgi?id=3950
package/multimedia/alsa-lib/alsa-lib-1.0.24.1-uclibc-missing-versionsort.patch

uClibc users ought to upgrade.

However, if you're trapped in a parallel space-time, you may place the attached
patch file in package/multimedia/alsa-lib/ for a shameful plug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
