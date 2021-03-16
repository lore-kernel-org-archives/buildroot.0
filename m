From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2021 09:42:34 +0000
Subject: [Buildroot] [Bug 13616] tar file from git repository generation
 issue
In-Reply-To: <bug-13616-163@https.bugs.busybox.net/>
References: <bug-13616-163@https.bugs.busybox.net/>
Message-ID: <bug-13616-163-zRg3Cztbjv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13616

--- Comment #4 from Jean-pierre Cartal <jpcartal@free.fr> ---
(In reply to Yann E. MORIN from comment #3)
Yann,

I think this is not a new behaviour, neither a new package, but up to now we've
been using the OVERRIDE_SRCDIR mechanism to generate binary tar files that were
then used as part of the build. We just tried to make a full build from sources
with this package and ended up hitting the reported issue.

I'll submit the patches to the mailing list as soon as possible.

Regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
