From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 May 2017 07:26:14 +0000
Subject: [Buildroot] [Bug 9906] genimage: Disk full
In-Reply-To: <bug-9906-163@https.bugs.busybox.net/>
References: <bug-9906-163@https.bugs.busybox.net/>
Message-ID: <bug-9906-163-6t4k1rfA7d@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9906

--- Comment #3 from Alexander Klauer <Alexander.Klauer@itwm.fraunhofer.de> ---
Just for the record, this was on version
a6a4a8b2ef1fa747fdc79bc7bae0518417910f5d. And yes, I added the ramdisk option
in the config, plus some other things.

I agree that more than 32M bootfs might not be necessary for most people. The
error simply came somewhat unexpected for me, since I "just changed the config"
;-)

Would it make sense to be able to configure the bootfs size via make nconfig
just as the rootfs size? Or at least print some error message pointing to the
appropriate genimage.cfg so that users don't have to dig for the size option?
If so, I could open an enhancement bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
