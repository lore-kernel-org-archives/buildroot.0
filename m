From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 21:30:24 +0100
Subject: [Buildroot] [PATCH] zsh: don't use host pcre-config
In-Reply-To: <20160306175005.GJ2877@tarshish>
References: <0f3d133b0082f11b75b9fad170d1b81211352dd6.1457041570.git.baruch@tkos.co.il>
 <20160306132313.17024d72@free-electrons.com>
 <20160306131518.GF2877@tarshish>
 <20160306143029.0f037047@free-electrons.com>
 <20160306175005.GJ2877@tarshish>
Message-ID: <20160306213024.020cbcad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 6 Mar 2016 19:50:05 +0200, Baruch Siach wrote:

> > Notice that there is another place in the configure.ac where
> > ac_cv_prog_PRECONF is already used.
> 
> Right. Provided that other ac_cv_ variables are used throughout zsh 
> configure.ac do you think is is worth the trouble to clean up 
> ac_cv_prog_PCRECONF use?

Probably not. I'll just apply your patch as-is.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
