From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Mar 2010 15:11:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1225] Buildroot fails to account for "nof"
 subdirectory (no floating point)
In-Reply-To: <bug-1225-163@https.bugs.busybox.net/>
References: <bug-1225-163@https.bugs.busybox.net/>
Message-ID: <20100303151149.086297779D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1225





--- Comment #3 from gnemesure <gnemesure@avtec.com>  2010-03-03 15:11:48 UTC ---
(In reply to comment #1)
> I am not able to reproduce, with a build for PowerPC 440, BR2_SOFT_FLOAT=y. So,
> something else must be different in your configuration. Could you attach your
> .config ?
> 

I've attached a .config file that should demonstrate the issue. I think it may
depend on the specific version of binutils selected.

> Note that your workaround is not very nice, since floating point emulation by
> the kernel is noticably slower that emulation in userspace.
> 

Yes, I assumed that would be the case. However, floating point computation is
not really central to my application, so this approach should be sufficient for
now.

Thanks.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
