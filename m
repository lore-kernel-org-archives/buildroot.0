From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 14:30:29 +0100
Subject: [Buildroot] [PATCH] zsh: don't use host pcre-config
In-Reply-To: <20160306131518.GF2877@tarshish>
References: <0f3d133b0082f11b75b9fad170d1b81211352dd6.1457041570.git.baruch@tkos.co.il>
 <20160306132313.17024d72@free-electrons.com>
 <20160306131518.GF2877@tarshish>
Message-ID: <20160306143029.0f037047@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Sun, 6 Mar 2016 15:15:19 +0200, Baruch Siach wrote:

> > So to me, this means that the expected "output" of this macro is to set
> > <variable>, which in your case is PRECONF.
> 
> Thanks for the information.

Note that the above was my own interpretation of the autoconf rules,
and what I generally see in most configure.ac. People knowing autoconf
better might disagree.

> This patch is now upstream, so I'll send another one upstream changing 
> $ac_cv_prog_PCRECONF to $PCRECONF. If upstream accepts that I'll send v2 with 
> a combined patch.

Notice that there is another place in the configure.ac where
ac_cv_prog_PRECONF is already used.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
