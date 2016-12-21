From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2016 16:53:33 +0100
Subject: [Buildroot] logrotate error
In-Reply-To: <CA+12NB+qmsHK7oivjdhgg=RccKKgBEUE6dJhMZFg5u9Lbuc2hQ@mail.gmail.com>
References: <CA+12NBJSywCO=azSzUtUdSS3irhXTUnhNpcRL6Rr-R=g_9UbHQ@mail.gmail.com>
 <20161221145757.727602a2@free-electrons.com>
 <CA+12NBJ5z0KaFhBWGQ9XARzbuAwKCo5Px7ZZvL-OFxjz=O-pSQ@mail.gmail.com>
 <CA+12NB+qmsHK7oivjdhgg=RccKKgBEUE6dJhMZFg5u9Lbuc2hQ@mail.gmail.com>
Message-ID: <20161221165333.412a7748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Dec 2016 10:38:12 -0500, Linux User wrote:

> Same results. I did "make clean all",
> 
> /home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> unknown architecture of input file
> `/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld'
> is incompatible with arm output
> /home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> error in
> /home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld(.eh_frame);
> no .eh_frame_hdr table will be created.
> collect2: error: ld returned 1 exit status

OK. What is your Buildroot version and .config file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
