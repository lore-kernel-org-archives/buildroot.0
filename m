From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 10:51:20 +0100
Subject: [Buildroot] [PATCH] vnstat: new package
In-Reply-To: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
References: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20120319105120.7dcafd10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 19 Mar 2012 10:48:05 +0100,
"Alvaro G. M" <alvaro.gamez@hazent.com> a ?crit :

> I think this could replace somehow ttcp in the near future. I've used
> it sometimes with the help of netcat to stablish a TCP connection.
> I am not sure I made this right, because vnstat doesn't use autotools,
> so there is no ./configure to do. Please, check it out.

Thanks for this package!

If it doesn't use the autotools, then you should use the GENTARGETS
infrastructure rather than the AUTOTARGETS one.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
