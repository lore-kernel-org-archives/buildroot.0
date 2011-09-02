From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Sep 2011 14:50:27 +0000 (UTC)
Subject: [Buildroot] [Bug 3817] Failed to compile binutils-2.21
In-Reply-To: <bug-3817-163@https.bugs.busybox.net/>
References: <bug-3817-163@https.bugs.busybox.net/>
Message-ID: <20110902145027.2AF408D3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3817

--- Comment #2 from S?rgio <sergio@serjux.com>  ---
(In reply to comment #0)

> I could work around this problem by doing the following:
> $cd /usr/lib
> $rm libc.so
> $ln -s /lib/libc.so.6 libc.so
> 
> But this is not the best way, because ASCII file /usr/lib/libc.so's missing
> incurs other problems, fox example "make menuconfig" fails to launch

I notice this workaround , is wrong , no,  /usr/lib/libc.so is not missing  ,
/usr/lib/libc.so, is in glibc-devel package.
Sometimes, also, some people do this wrong workaround when need the static
libraries which normally are in a package glibc-static

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
