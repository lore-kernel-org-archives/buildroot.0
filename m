From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 18:24:40 +0100
Subject: [Buildroot] [PATCH v2 1/2] pcre: add UTF support option
In-Reply-To: <1382696898-1901-1-git-send-email-yegorslists@googlemail.com>
References: <1382696898-1901-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20131027182440.507e4c6f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Oct 2013 12:28:17 +0200, yegorslists at googlemail.com wrote:

> +config BR2_PACKAGE_PCRE_UTF
> +	bool "UTF support"
> +	help
> +	  This option enables UTF support

I would maybe change this to UTF-8/16/32 support, which is what
the ./configure help text says.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
