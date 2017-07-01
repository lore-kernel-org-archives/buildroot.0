From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:09:38 +0200
Subject: [Buildroot] [PATCH] ndisc6: patch no longer required
In-Reply-To: <20170627190833.GA5404@waldemar-brodkorb.de>
References: <20170627190833.GA5404@waldemar-brodkorb.de>
Message-ID: <20170701100938.6d27d93d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 21:08:33 +0200, Waldemar Brodkorb wrote:
> In uClibc-ng 1.0.25 the issue was fixed and FAVOR_BSD is gone.

This is not true I believe: the problem was fixed in uClibc commit
58a5ba12bffad5916d9897c2870fc483f1db8282, which is *not* in 1.0.25. So
the problem is fixed only with uClibc-ng 1.0.25 + the patch currently
in package/uclibc/.

So I need to hold off on this until I rebuild all the toolchains with
the latest uClibc-ng 1.0.25 + patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
