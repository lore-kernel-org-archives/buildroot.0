From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 22:00:59 +0100
Subject: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
In-Reply-To: <trinity-2bbfe20d-7483-4696-96fd-10d5a86139a3-1420922912380@3capp-gmx-bs51>
References: <trinity-2bbfe20d-7483-4696-96fd-10d5a86139a3-1420922912380@3capp-gmx-bs51>
Message-ID: <20150110220059.6aa33cb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 10 Jan 2015 21:48:32 +0100, Peter Seiderer wrote:

> >       - Remove the mention of CONFIG_SPI_BCM2708, since this makes the
> >         description RaspberryPi specific, while these drivers can work
> >         with any SPI controller.
> 
> Maybe add some hint to not forget to enable platform specific spi driver
> would be helpful?

Sure, feel free to send some follow-up patch.


> >       - Change the license to GPLv2, since it's kernel code.]
> 
> Mhhh, in some way your are right, but it seems wrong for me that the
> buildroot license entry does not reflect what the package author stated
> in his own files....what would be the right buildroot entry in case
> of dual-license files?

That's a good question. I really wonder how the original author can
license those files under GPLv2+, while the kernel license is GPLv2
only. I think the original author is wrong on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
