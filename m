From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Sep 2014 12:38:10 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit builds a static application,
 even though BR2_PREFER_STATIC_LIB is not set, and with glibc.
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140905123810.5286B9D607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

--- Comment #11 from syntheticpp at gmx.net 2014-09-05 12:38:10 UTC ---
(In reply to comment #9)
> When the C library is glibc/eglibc, we copy those files to the target:
>     LIB_EXTERNAL_LIBS+=libnss_files.so.* libnss_dns.so.*
> 
> Can you confirm those files are present in your target?

Yes, they are.

> 
> Regarding the delay to login: what is your authentication method? Maybe there
> are a few other libnss files tht should be copied over...

In meantime I saw it also with the other build, so not related to this bug
here.

> 
> Regards,
> Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
