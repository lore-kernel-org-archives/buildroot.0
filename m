From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 12:46:21 +0200
Subject: [Buildroot] [PATCH 1/2] raspberrypi2: switch Linux kernel to
 rpi-3.18.y
In-Reply-To: <CA+-urNS+Bp2KA49kn8-d04TPMbKZ4NzOcQ1sqM=Lh7Pqwpfg9A@mail.gmail.com>
References: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
 <20150501102558.338835cc@free-electrons.com>
 <CA+-urNS+Bp2KA49kn8-d04TPMbKZ4NzOcQ1sqM=Lh7Pqwpfg9A@mail.gmail.com>
Message-ID: <20150501124621.23e44abe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 May 2015 06:20:28 -0400, Frank Hunleth wrote:

> > What about the raspberrypi_defconfig ? Is there any reason to keep it
> > around using the 3.12 kernel ? Or can we rename
> > raspberrypi_dt_defconfig to raspberrypi_defconfig ?
> 
> I've never used raspberrypi_defconfig, so I would be in favor of this.

Yann, your thought?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
