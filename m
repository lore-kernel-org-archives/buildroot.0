From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 May 2013 09:42:22 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20130522094222.D30C69A45E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #13 from richard.genoud at gmail.com 2013-05-22 09:41:14 UTC ---
Created attachment 4916
  --> https://bugs.busybox.net/attachment.cgi?id=4916
bisect script to dectect if zImage is overwritten when make uImage is called

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
