From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 14:59:14 +0200
Subject: [Buildroot] [PATCH] sdl2: new package
In-Reply-To: <551946AF.6090008@oliseo.fr>
References: <1424944071-6473-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20150313171451.197d5822@free-electrons.com>
 <551946AF.6090008@oliseo.fr>
Message-ID: <20150330145914.1f65f24c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET - Olis?o,

On Mon, 30 Mar 2015 14:50:55 +0200, Guillaume GARDET - Olis?o wrote:

> >    http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config
> 
> This one fails with:
> "dlfcn.h: No such file or directory"
> 
> WHat would be the right "dpends on" option?

depends on !BR2_STATIC_LIBS

and the appropriate comment. See section "17.2.2. Dependencies on
target and toolchain options" in the Buildroot manual.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
