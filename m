From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 11:30:10 +0100
Subject: [Buildroot] [PATCH] vim: Add option to remove documentation
 from target
In-Reply-To: <1360664095-16562-1-git-send-email-markos.chandras@gmail.com>
References: <1360664095-16562-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130212113010.014297ac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 12 Feb 2013 10:14:55 +0000, Markos Chandras wrote:

> +config BR2_PACKAGE_VIM_REMOVE_DOCS
> +	bool "remove documentation"
> +	default y
> +	depends on BR2_PACKAGE_VIM
> +	help
> +	  Remove documentation files from the target.
> +	  This option removes about 5.6MB of data from /usr/share/

Please don't add a special option for this: use BR2_HAVE_DOCUMENTATION
instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
