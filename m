From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jan 2013 12:16:48 +0100
Subject: [Buildroot] [PATCH v2 1/2] Adding yavta (Yet Another V4L2 Test
 Application) as a package
In-Reply-To: <1357815520-4461-1-git-send-email-kpa_info@yahoo.fr>
References: <1357815520-4461-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130110121648.299b35d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear kpa_info at yahoo.fr,

On Thu, 10 Jan 2013 11:58:39 +0100, kpa_info at yahoo.fr wrote:

> +config BR2_PACKAGE_YAVTA
> +	bool "yavta"
> +	help
> +	  Yet Another V4L2 Test Application
> +
> +     http://git.ideasonboard.org/yavta.git  

The indentation is wrong for the URL, and it confuses menuconfig, which
does not even start. Can you fix this indentation? I.e:

-     http://git.ideasonboard.org/media-ctl.git 
+         http://git.ideasonboard.org/media-ctl.git

Also, your URL line had trailing spaces.

Same problem on your media-ctl package.

Once this is fixed, for both packages:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
