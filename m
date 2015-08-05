From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2015 13:23:22 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150805132322.6331A81E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-05 13:23:22 UTC ---
Thanks for your bug report. Can you first make sure that you can reproduce the
issue after doing a full rebuild, i.e after doing "make clean all" ?

Once you have verified this, could you please give us:


 - The Buildroot version you're using
 - The exact steps to reproduce the issue

 - What you mean exactly by "gmake process points to the host
/usr/bin/objcopy". make doesn't "point" to anything, so this sentence doesn't
make a lot of sense.

Also, please attach the last 100 lines of the build output, which contain the
build failure you're seeing. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
