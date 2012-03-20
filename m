From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 14:15:30 +0100
Subject: [Buildroot] [PATCH] Config.in.arch: add help and less cryptic
 names to architecture menu
In-Reply-To: <1332194166-30225-1-git-send-email-alvaro.gamez@hazent.com>
References: <1332112382-30786-1-git-send-email-alvaro.gamez@hazent.com>
 <1332194166-30225-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20120320141530.4ace4c93@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Mar 2012 22:56:06 +0100,
"Alvaro G. M" <alvaro.gamez@hazent.com> a ?crit :

> From: "Alvaro G. M" <alvaro.gamez@hazent.com>
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>

Thanks!

One minor nitpick, below.

> +	bool "ARM (little endian)"
> +	bool "ARM (big endian)"
> -	bool "Microblaze AXI (little-endian)"
> +	bool "Microblaze AXI (little endian)"

but:

>  	bool "Microblaze non-AXI (big-endian)"

So I guess you want to change this one to "big endian". Probably not
needed to send a new version just for this, I guess Peter can fix this
up will committing.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
