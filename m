From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 09:25:02 +0200
Subject: [Buildroot] [PATCH 3/3] odroidc2: update boot.ini
In-Reply-To: <trinity-6f6661cd-f250-4e75-b09d-92147f2f08d5-1469336092267@3capp-mailcom-bs13>
References: <20160723185501.12148-1-daggs@gmx.com>
 <20160723185501.12148-3-daggs@gmx.com>
 <20160723232849.61c4fe4a@free-electrons.com>
 <trinity-6f6661cd-f250-4e75-b09d-92147f2f08d5-1469336092267@3capp-mailcom-bs13>
Message-ID: <20160724092502.65792240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 06:54:52 +0200, daggs wrote:

> > > +if test "${mesontimer}" = "0"; then fdt rm /meson_timer; fdt rm /cpus/cpu at 0/timer; fdt rm /cpus/cpu at 1/timer; fdt rm /cpus/cpu at 2/timer; fdt rm /cpus/cpu at 3/timer; fi
> > > +if test "${mesontimer}" = "1"; then fdt rm /timer; fi
> > > +
> > > +if test "${nographics}" = "1"; then fdt rm /reserved-memory; fdt rm /aocec; fi
> > > +if test "${nographics}" = "1"; then fdt rm /meson-fb; fdt rm /amhdmitx; fdt rm /picdec; fdt rm /ppmgr; fi
> > > +if test "${nographics}" = "1"; then fdt rm /meson-vout; fdt rm /mesonstream; fdt rm /meson-fb; fi
> > > +if test "${nographics}" = "1"; then fdt rm /deinterlace; fdt rm /codec_mm; fi  
> > 
> > Yerk :-/  
> I don't write the code, I just relay it to buildroot.

Where is this code coming from? Any chance we use directly the upstream
version rather than having a copy in Buildroot?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
