From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Jul 2016 09:53:07 +0000
Subject: [Buildroot] [Bug 9096] rootfs.ubi not created
In-Reply-To: <bug-9096-163@https.bugs.busybox.net/>
References: <bug-9096-163@https.bugs.busybox.net/>
Message-ID: <bug-9096-163-dLbGvJFNkj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9096

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
It works just fine here.

Could you:

 *) Confirm that you can reproduce with the sama5d4_xplained configuration
without any *change*

 *) Attach your Buildroot .config file.

 *) Attach the last ~100 lines of the build output, so we can see what's going
on?

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
