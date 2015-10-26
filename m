From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 04:57:35 +0100
Subject: [Buildroot] [PATCH 0/4] Supporting a second Barebox build to
 build the MLO/SPL
In-Reply-To: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
Message-ID: <20151026045735.52c0f9e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieter Smith,

On Sun, 25 Oct 2015 20:33:52 +0100, Pieter Smith wrote:

> Pieter Smith (4):
>   barebox: prepare for x-loader build
>   barebox: adds option to build x-loader
>   barebox: user selection of build output images
>   beaglebone: adds barebox bootloader defconfig
> 
>  boot/barebox/Config.in                        | 92 +++++++++++++++++++++++++++
>  boot/barebox/barebox-boot/barebox-boot.hash   |  1 +
>  boot/barebox/barebox-boot/barebox-boot.mk     | 89 ++++++++++++++++++++++++++
>  boot/barebox/barebox-xload/barebox-xload.hash |  1 +
>  boot/barebox/barebox-xload/barebox-xload.mk   | 51 +++++++++++++++
>  boot/barebox/barebox.mk                       | 60 +----------------
>  configs/beaglebone_barebox_defconfig          | 38 +++++++++++

I believe "xload" is really a term tied to the OMAP platforms, but
Barebox can have this dual configuration situation for other platforms
as well (ex: Atmel). Some other platforms use the term "SPL".

Can we find some better name ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
