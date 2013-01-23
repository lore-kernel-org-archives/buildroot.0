From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jan 2013 17:03:18 +0100
Subject: [Buildroot] [PATCH] barebox: Allow to build an environment image
In-Reply-To: <1358869242-13472-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1358869242-13472-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20130123170318.0d1dfe61@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Ripard,

On Tue, 22 Jan 2013 16:40:42 +0100, Maxime Ripard wrote:

> +config BR2_TARGET_BAREBOX_CUSTOM_ENV
> +	bool "Generate an environment image"
> +	help
> +	  Generate a custom environment image.
> +
> +config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
> +	string "Environment path"
> +	depends on BR2_TARGET_BAREBOX_CUSTOM_ENV
> +	help
> +	  Path to the custom barebox environment

In general I'm fine, but I'd like to see more details in the help text
here. At least explaining what is an environment image, that it gets
generated from a text file in such or such format (possibly with a
pointer into the Barebox documentation). Make it clear that
BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH is the path to the source
environment, and where the image will be generated, with what name, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
