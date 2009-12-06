From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Dec 2009 20:19:40 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20091206201940.94684777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759





--- Comment #5 from Lionel Landwerlin <llandwerlin@gmail.com>  2009-12-06 20:19:40 UTC ---
(In reply to comment #4)
> 
> I don't normally use an external toolchain, but from a quick look it seems to
> me like you still have the 'Enable toolchain locale/i18n support?' option when
> you use an external toolchain. If your crosstool-ng toolchain doesn't have
> locale support, then don't enable that option.
> 

Yes, buildroot forces to set this option.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
