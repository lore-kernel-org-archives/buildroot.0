From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 21:20:28 +0200
Subject: [Buildroot] [PATCH v2] uclibc: update to 1.0.23
In-Reply-To: <20170403181802.GA1816@waldemar-brodkorb.de>
References: <20170403181802.GA1816@waldemar-brodkorb.de>
Message-ID: <20170403212028.2214ea0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Apr 2017 20:18:02 +0200, Waldemar Brodkorb wrote:

> +config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
> +	bool

You need a prompt here to tell the user what's going on.

> +	select BR2_LEGACY
> +	help
> +	  uClibc-ng removed internal RPC implementation in 1.0.23.

And this should have suggested to use libtirpc instead.

I've fixed those two issues and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
