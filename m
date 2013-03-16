From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Mar 2013 19:11:53 +0100
Subject: [Buildroot] [PATCH] libcap: Add optional support for libattr
 capabilities
In-Reply-To: <1363364558-5321-1-git-send-email-markos.chandras@gmail.com>
References: <1363364558-5321-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130316191153.29c28d2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Fri, 15 Mar 2013 16:22:38 +0000, Markos Chandras wrote:

> +ifeq ($(BR2_PACKAGE_ATTR),y)
> +	LIBCAP_DEPENDENCIES += host-attr attr

We don't generally tie dependencies of host packages on
BR2_PACKAGE_<foo> options. Is there a specific reason that requires
host-libcap to be built against host-attr?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
