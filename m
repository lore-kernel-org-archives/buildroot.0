From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 10:00:03 +0100
Subject: [Buildroot] [PATCH v5] libiio: new package
In-Reply-To: <54ACF478.4080509@analog.com>
References: <1418722446-3831-1-git-send-email-paul.cercueil@analog.com>
 <20141221223930.6965ea9e@free-electrons.com>
 <54ACF478.4080509@analog.com>
Message-ID: <20150107100003.33c641db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Wed, 7 Jan 2015 09:55:20 +0100, Paul Cercueil wrote:

> Thanks for merging this patch - and thanks for the extra work.
> 
> I see you added a dependency on thread support in the toolchain, is it 
> because it breaks some builds if not set?
> The library in itself will work just fine on a system without threads, 
> only the IIO Daemon requires threads, that's why I'm asking.

I honestly don't remember. You can try building with the base config
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
and see what breaks (of course after removing the dependency on
threads).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
