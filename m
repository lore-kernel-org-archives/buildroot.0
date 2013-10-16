From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Oct 2013 09:40:37 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <525E4115.5080703@gmail.com>
References: <525BAB59.4020105@gmail.com> <20131014114754.12f56017@skate>
 <525BCC9C.9020602@gmail.com> <20131014134753.33a41074@skate>
 <525BED56.5030704@gmail.com>
 <CAAXf6LXB8+5bjhZ3Y0ftNR0aQVK8Rvge_YDq-KvhfpORO8LPMw@mail.gmail.com>
 <525C0C82.6090801@gmail.com> <525C1100.9040608@gmail.com>
 <20131014184341.6ba6e0c4@skate> <525E4115.5080703@gmail.com>
Message-ID: <20131016094037.39becd64@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Wed, 16 Oct 2013 09:32:37 +0200, Marco Trapanese wrote:

> config BR2_PACKAGE_SENSORAY2253
>      bool "sensoray2253"
>      depends on BR2_LINUX_KERNEL
>      depends on BR2_LIBV4L

This Config.in option does not exist, so there is no chance for it to
ever be enabled, and therefore your package will never be visible.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
