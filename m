From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:30:12 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.23
In-Reply-To: <20170403051652.GA32479@waldemar-brodkorb.de>
References: <20170403051652.GA32479@waldemar-brodkorb.de>
Message-ID: <20170403143012.41cd408a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Apr 2017 07:16:52 +0200, Waldemar Brodkorb wrote:

> -config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
> -	bool "Enable RPC support"
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	help
> -	  Enable this option if you want your toolchain to support
> -	  RPC (needed for NFS, for example).
> -

You're removing an option here, so it needs Config.in.legacy handling.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
