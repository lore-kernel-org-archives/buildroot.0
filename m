From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jul 2010 19:14:28 +0000 (UTC)
Subject: [Buildroot] [Bug 635] util-linux fails to build in 2009.08
In-Reply-To: <bug-635-163@https.bugs.busybox.net/>
References: <bug-635-163@https.bugs.busybox.net/>
Message-ID: <20100728191428.BC75D834D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=635

--- Comment #6 from S?rgio <sergio@sergiomb.no-ip.org>  ---
Created attachment 2269
  --> https://bugs.busybox.net/attachment.cgi?id=2269
last .config

(In reply to comment #5)
> Please provide your Buildroot .config to allow us to reproduce the issue.

linux/a.out.h seems to belongs to kernel headers and I don't have a kernel
cross-compiled. which make more.c depends on kernel-headers, because needs 3
constants ?! OMAGIC NMAGIC ZMAGIC. 

I got a CPU "core i5", which I can compile this in more or less one hour , 
I need do 2 or 3 times :
make flush
make

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
