From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Jul 2009 02:10:50 +0000 (UTC)
Subject: [Buildroot] [Bug 505] live555: new package
In-Reply-To: <bug-505-163@https.bugs.busybox.net/>
References: <bug-505-163@https.bugs.busybox.net/>
Message-ID: <20090731021050.83B30777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=505





--- Comment #5 from Kelvin Cheung <keguang.zhang@gmail.com>  2009-07-31 02:10:49 UTC ---
(In reply to comment #3)
> After a quick look at the patch :
>  * I think we could make the config.arm-linux thing a little more generic, so
> as to support other architectures as well
>  * The config.arm-linux should probably be generated, or at least sed'ed by the
> .mk file, to really use $(TARGET_CC), $(TARGET_CFLAGS), $(TARGET_LD),
> $(TARGET_LDFLAGS), etc. This would for example fix this package with external
> toolchains
> 

Now, the patch could support both x86 and arm.

Other architectures such as alpha and blackfin are already supported by
'genMakefiles' (something like configure).
But I do not have toolchains except x86 and arm.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
