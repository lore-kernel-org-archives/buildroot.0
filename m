From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:36:55 +0100
Subject: [Buildroot] Buildroot 2014.02 : make on raspberry pi failed
In-Reply-To: <CACfHD-gFTUe-ybERH4tHGHx7b8zpvDv2ULY2m2eZ-=0WmJHfdw@mail.gmail.com>
References: <CACfHD-gFTUe-ybERH4tHGHx7b8zpvDv2ULY2m2eZ-=0WmJHfdw@mail.gmail.com>
Message-ID: <20140304193655.27b3f3ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cyrille DERORY,

On Tue, 4 Mar 2014 10:22:11 +0100, Cyrille DERORY wrote:

> I have tried to build for the raspberry pi target with the following :
> make raspberrypi_defconfig
> make

Have you done previous builds before? If yes, have you done a "make
clean" in between?

Generally speaking, does this problem also occurs if you do:

make clean
make raspberrypi_defconfig
make

 ?

> I have an error :
> 
> mkdir: impossible de cr?er le r?pertoire
> ? /home/cderory/T?l?chargements/buildroot/buildroot-2014.02/output/target/var/cache
> ?:
> N'est pas un dossier
> Makefile:507: recipe for target 'target-finalize' failed

Can you include a larger part of the commit, such as the last 100 or
so ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
