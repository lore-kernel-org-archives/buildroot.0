From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 15:23:25 +0200
Subject: [Buildroot] [PATCH v2 5/6] qt: Add option for enabling the
 accessibility support
In-Reply-To: <1468315820-9341-6-git-send-email-romain.perier@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-6-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160715152325.31d8cf33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 11:30:19 +0200, Romain Perier wrote:

> +config BR2_PACKAGE_QT_ACCESSIBILITY
> +	bool "Enable accessibility support"
> +	help
> +	  This enables and compile the accessibility support.

s/compile/compiles/

Applied with this typo fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
