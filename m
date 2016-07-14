From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 10:36:01 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/Config: ti-sgx-km, ti-sgx-um,
 ti-sgx-demos
In-Reply-To: <1468440819-13434-5-git-send-email-lothar.felten@gmail.com>
References: <1468440819-13434-1-git-send-email-lothar.felten@gmail.com>
 <1468440819-13434-5-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160714103601.2ec704d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jul 2016 22:13:39 +0200, Lothar Felten wrote:

>  	source "package/sysstat/Config.in"
>  	source "package/targetcli-fb/Config.in"
>  	source "package/ti-gfx/Config.in"
> +	source "package/ti-sgx-demos/Config.in"
> +	source "package/ti-sgx-km/Config.in"
> +	source "package/ti-sgx-um/Config.in"

These three lines should go in each patch adding each of those packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
