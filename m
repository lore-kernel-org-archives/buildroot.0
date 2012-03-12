From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 23:04:54 +0100
Subject: [Buildroot] [PATCH v2] config: make it possible to specify
 which config file to use for 'make defconfig'
In-Reply-To: <1331464482-5827-1-git-send-email-arnout@mind.be>
References: <1331464482-5827-1-git-send-email-arnout@mind.be>
Message-ID: <20120312230454.208d8977@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 11 Mar 2012 12:14:42 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> So that this works:
> 
>  % make defconfig BR2_DEFCONFIG=~/buildroot-defconfig
> 
> Right now we have to do:
> 
>  % cp ~/buildroot-defconfig configs/buildroot_defconfig
>  % make buildroot_defconfig
> 
> That would dirty the buildroot tree and requires it to be writable.
> 
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
