From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Dec 2016 23:21:35 +0100
Subject: [Buildroot] [PATCH 2/2] collectd: fix riemann write plugin
 dependencies
In-Reply-To: <20161228221806.32321-2-peter@korsgaard.com>
References: <20161228221806.32321-1-peter@korsgaard.com>
 <20161228221806.32321-2-peter@korsgaard.com>
Message-ID: <20161228232135.2946638d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Dec 2016 23:18:06 +0100, Peter Korsgaard wrote:

> -	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool protobuf-c) \
> +	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool riemann-c-client) \

libtool is still needed ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
