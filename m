From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Aug 2009 22:12:00 +0000 (UTC)
Subject: [Buildroot] [Bug 573] BR2_DEFAULT_KERNEL_HEADERS is undefined with
 external toolchain
In-Reply-To: <bug-573-163@https.bugs.busybox.net/>
References: <bug-573-163@https.bugs.busybox.net/>
Message-ID: <20090826221200.89433776AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=573





--- Comment #7 from Phil <n0-1@nwl.cc>  2009-08-26 22:11:59 UTC ---
(In reply to comment #6)
> This shouldn't happend with the official BR tree, as we don't display the
> BR2_KERNEL_LINUX option when an external toolchain is used.

Indeed. The official tree simply skips kernel compilation or, when
BR2_KERNEL_LINUX_ADVANCED
has been specified, allows specification of the desired linux version, too.

> Is there any specific reason why you are using Bernhard's tree instead of the
> official one?

I was searching for glibc-based toolchain support, which sadly occurs to be not
complete in Bernhard's
tree, too. I didn't know of the external toolchain support option in busybox,
so I just tried that on
occasion.

Filing this report to the wrong site was just because of me having forgotten
that I didn't use the official
sources. So, thanks for your patience and sorry for the inconvenience.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
