From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 09:26:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix build issue with
 some toolchains
In-Reply-To: <1445933042.18019.8.camel@embedded.rocks>
References: <1445894151-27841-1-git-send-email-joerg.krause@embedded.rocks>
 <20151026230404.1501048e@free-electrons.com>
 <1445933042.18019.8.camel@embedded.rocks>
Message-ID: <20151027092605.76aa8405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 27 Oct 2015 09:04:02 +0100, J?rg Krause wrote:

> swupdate uses simplified Kbuild files from the Linux Kernel so I was
> not sure about touching the existing Makefiles. But there are some
> benefits to prefer gcc over ld for partial linking.
> 
> I'll prepare a patch for upstream. Usually, Stefano (swupdate
> maintainer) reviews patches near-time. If he accepts, we can backport
> from upstream, right?

Yes, of course.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
