From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jan 2011 12:08:31 +0100
Subject: [Buildroot] [PATCH 1/2] liberation: add support for custom
 target directory
In-Reply-To: <1294830195-11438-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1294830195-11438-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20110112120831.244cacff@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jan 2011 12:03:14 +0100
Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:

> +if BR2_PACKAGE_LIBERATION
> +
> +config BR2_PACKAGE_LIBERATION_INSTALL_DIR
> +	string "Install directory"
> +	default "/usr/share/fonts/liberation"
> +	help
> +	  Target directory where the fonts should be installed
> +
> +endif

Why would this be necessary ?

In other words, which use case is this solving ? If it's a general font
location problem, maybe this should not be a Liberation-specific option.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
