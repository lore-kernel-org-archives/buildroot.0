From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 16:00:13 +0200
Subject: [Buildroot] [PATCH 04/20] toolchain-external: improve glibc
 support to test availability of RPC
In-Reply-To: <CAHkwnC_xe8CChBeuoW85EnQLZ_A1PiOQE3Woxqr1NS_GZGFByg@mail.gmail.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <80f89c34315be739c52935f1b0606dc5531e6eb3.1344706801.git.thomas.petazzoni@free-electrons.com>
 <CAHkwnC_xe8CChBeuoW85EnQLZ_A1PiOQE3Woxqr1NS_GZGFByg@mail.gmail.com>
Message-ID: <20120822160013.7b929891@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 10:20:34 +0200,
Fabio Porcedda <fabio.porcedda@gmail.com> a ?crit :

> I have a build problem with this patch, even when i select a
> toolchaing with the native rpc the test fail:
> 
> make:
> Checking external toolchain settings
> RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC
> make: *** [/home/fabiopo/at91sam9260ek/buildroot-rpc-support/output/stamps/ext-toolchain-checked]
> Error 1
> 
> defconfig:
> BR2_arm=y
> BR2_arm926t=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103=y

Thanks for testing, I'll look into this!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
