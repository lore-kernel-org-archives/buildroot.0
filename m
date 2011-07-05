From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 21:47:06 +0200
Subject: [Buildroot] [PATCH 24/28] Improve TARGETS handling for
 bootloaders and kernel
In-Reply-To: <201107050027.11292.yann.morin.1998@anciens.enib.fr>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <dd17a4cd8c4097bbeef45838f4c9dd11325c3aa8.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107050027.11292.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110705214706.12ab1f8f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 5 Jul 2011 00:27:11 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> > This commit improves the package infrastructure so that it looks at
> > BR2_PACKAGE_<pkg> for packages, BR2_BOOT_<pkg> for bootloaders and at
> > the special BR2_LINUX_KERNEL for the linux package.
> 
> For consistency, I'd suggest using 'BR2_KERNEL_LINUX'.

Well, it doesn't make a big difference, but I have no strong opinion
about this. What's the opinion of others ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
