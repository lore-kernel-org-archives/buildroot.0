From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 09:11:52 +0200
Subject: [Buildroot] [PATCH/next v2 2/2] gcc: remove BR2_GCC_ENABLE_TLS
	option
In-Reply-To: <53993701-c8a4-09d9-5d0f-6510a8f0812b@mind.be>
References: <1472592808-18270-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1472592808-18270-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <53993701-c8a4-09d9-5d0f-6510a8f0812b@mind.be>
Message-ID: <20160831091152.531b06f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 00:58:36 +0200, Arnout Vandecappelle wrote:

> > +# TLS support is not needed on uClibc/no-thread and  
> 
>  I thought it was not even available for nothread or linuxthreads?

Well: TLS support is provided by the compiler and used by the C
library. At least that's how I see it. Since here we are in gcc.mk, we
are talking from the point of the view of the compiler, hence the "TLS
support is not needed for <this C library> variant".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
