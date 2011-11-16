From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Nov 2011 12:11:59 +0000 (UTC)
Subject: [Buildroot] [Bug 4021] uClibc: undefined reference to
	`__GI___errno_location'
In-Reply-To: <bug-4021-163@https.bugs.busybox.net/>
References: <bug-4021-163@https.bugs.busybox.net/>
Message-ID: <20111116121159.E55528F589@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4021

--- Comment #5 from ke <konrad@gaisler.com> 2011-11-16 12:11:59 UTC ---
Created attachment 3752
  --> https://bugs.busybox.net/attachment.cgi?id=3752
get rid of errno_location error

Unhide __errno_location to avoid undefined symbol errror

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
