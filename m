From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2010 19:48:12 +0100
Subject: [Buildroot] undefined reference to copysignl
In-Reply-To: <20100212193841.530e2caa@surf>
References: <13abadeb1002120953q24b91634j5f17c9ce93cc634a@mail.gmail.com>
	<13abadeb1002120954l10e05e25y36f5738a02d16d1c@mail.gmail.com>
	<20100212193841.530e2caa@surf>
Message-ID: <20100212194812.388ecf4b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2010 19:38:41 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Something like
>  http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
> maybe ?

Well, this patch was controversial it seems. The OpenWRT guys have
instead integrated a fix for uClibc:
 https://dev.openwrt.org/browser/trunk/toolchain/uClibc/patches-0.9.30.1/450-powerpc_copysignl.patch?rev=18178

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
