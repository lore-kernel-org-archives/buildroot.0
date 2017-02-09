From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:26:23 +0100
Subject: [Buildroot] [PATCH] util-linux: link scriptreplay with libm
 (for isnan)
In-Reply-To: <326911969.7218535.1486675226666.JavaMail.zimbra@datacom.ind.br>
References: <1486567063-21852-1-git-send-email-casantos@datacom.ind.br>
 <20170209221444.3c4674a9@free-electrons.com>
 <326911969.7218535.1486675226666.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170209222623.20c9a7e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Feb 2017 19:20:26 -0200 (BRST), Carlos Santos wrote:

> Patch 2/2 was accepted upstream. Quoting the maintainer (Karel Zak):

Great!

> ?Applied, thanks. (It would be possible to use AC_COMPILE_IFELSE() monster,
> but if AC_CHECK_LIB() is good enough than it's probably better.)?

Indeed, AC_COMPILE_IFELSE() would have been the alternative, but it's
admittedly a bit more complicated.

So if it's been merged upstream, we're good.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
