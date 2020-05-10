From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 10 May 2020 15:23:47 +0000
Subject: [Buildroot] [Bug 12876] putilimp.h **error**: missing binary
 operator before token "(" #elif __has_builtin(__c11_atomic_load) && \
In-Reply-To: <bug-12876-163@https.bugs.busybox.net/>
References: <bug-12876-163@https.bugs.busybox.net/>
Message-ID: <bug-12876-163-5rFepmZD4h@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
I think that the following patch should fix your build failure:
https://patchwork.ozlabs.org/project/buildroot/patch/20200218031521.32988-1-james.hilliard1 at gmail.com

However, it was not yet merged.
Can you confirm that this patch fix your issue?

Best Regards,

Fabrice

-- 
You are receiving this mail because:
You are on the CC list for the bug.
