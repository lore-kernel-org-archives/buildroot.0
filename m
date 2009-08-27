From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Aug 2009 13:44:48 +0000 (UTC)
Subject: [Buildroot] [Bug 573] BR2_DEFAULT_KERNEL_HEADERS is undefined with
 external toolchain
In-Reply-To: <bug-573-163@https.bugs.busybox.net/>
References: <bug-573-163@https.bugs.busybox.net/>
Message-ID: <20090827134448.AC48B77744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=573





--- Comment #8 from Bernhard Reutner-Fischer <aldot@uclibc.org>  2009-08-27 13:44:47 UTC ---
(In reply to comment #7)
> (In reply to comment #6)
> > This shouldn't happend with the official BR tree, as we don't display the
> > BR2_KERNEL_LINUX option when an external toolchain is used.
> 
> Indeed. The official tree simply skips kernel compilation or, when
> BR2_KERNEL_LINUX_ADVANCED
> has been specified, allows specification of the desired linux version, too.

My tree does not support external toolchains, just FYI.
> 
> > Is there any specific reason why you are using Bernhard's tree instead of the
> > official one?
> 
> I was searching for glibc-based toolchain support, which sadly occurs to be not
> complete in Bernhard's

I only added stub-functionality for the buildroot parts to show people how
i would implement it cleanly.

Let me note that if you want glibc and an external toolchain then i personally
would use gentoo or some such.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
