From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:47:51 +0200
Subject: [Buildroot] [PATCH] package/argparse: new package
In-Reply-To: <20160602150553.28323-1-m.niestroj@grinn-global.com>
References: <20160602150553.28323-1-m.niestroj@grinn-global.com>
Message-ID: <20160611164751.2818f012@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 17:05:53 +0200, Marcin Niestroj wrote:

> +config BR2_PACKAGE_ARGPARSE
> +	bool "argparse"
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER

This dependency is not needed, since argparse/Config.in is already
included in an if ... endif block with this condition.

I've fixed this and applied your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
