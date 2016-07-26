From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 17:19:05 +0200
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726150854.GB3588@tarshish>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
 <20160726100101.208d0299@free-electrons.com>
 <20160726111557.GY3588@tarshish>
 <20160726134801.1d2eb91b@free-electrons.com>
 <20160726121429.GA3588@tarshish>
 <20160726145248.5dc5a39a@free-electrons.com>
 <20160726150854.GB3588@tarshish>
Message-ID: <20160726171905.486bd4bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 18:08:54 +0300, Baruch Siach wrote:

> I verified that config.h macros are defined in libbb.h before posting the last 
> patch, by using another defined macros. I repeated this test as you suggested, 
> with HAVE_FORK and the current br-arm-full.config, just to be sure. The #error 
> triggers as expected in both tests.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
