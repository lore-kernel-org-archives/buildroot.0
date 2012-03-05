From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 10:49:29 +0100
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <1330788921-27127-1-git-send-email-arnout@mind.be>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
Message-ID: <20120305104929.00b97692@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat,  3 Mar 2012 15:35:21 +0000,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

>  board/bifferboard/busybox-1.19.x.config | 1013 +++++++++++++++++++++++++++++++

Isn't is possible to store minimal .config for Busybox, as we do for
the kernel?

>  boot/grub/grub.mk                       |    1 +

Is the change in grub.mk really related to this patch?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
