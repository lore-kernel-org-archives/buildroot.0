From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 22:42:57 +0100
Subject: [Buildroot] [PATCH 1/1] bash: added option to disable locale
 support
In-Reply-To: <1425935595-46330-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1425935595-46330-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150309224257.2c985fbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon,  9 Mar 2015 16:13:15 -0500, Matt Weber wrote:

> +if BR2_PACKAGE_BASH
> +
> +config BR2_PACKAGE_BASH_NO_LOCALE
> +	bool "disable locale support"
> +	help
> +	  Disable locale support for cases where toolchain has it
> +	  but target isn't setup to use it.
> +
> +endif

To be honest, I'm not sure we want to support such cases. What does it
mean for the target to not be setup to use locales?

What is the opinion of other Buildroot developers?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
