From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 23:05:07 +0100
Subject: [Buildroot] ffmpeg issue with MIPS
In-Reply-To: <CAMbDF3+pfHWMz1iYOxY-rnBJkBRhxw534dGacPbKMLF_+OQTHg@mail.gmail.com>
References: <CAMbDF3KbAxppKmMVLWduL6B1RSLPriuErWcVTOt2wx-=+TE7GQ@mail.gmail.com>
 <20180103225057.79846679@windsurf.lan>
 <CAMbDF3+pfHWMz1iYOxY-rnBJkBRhxw534dGacPbKMLF_+OQTHg@mail.gmail.com>
Message-ID: <20180103230507.11741c21@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot mailing list in Cc. Thanks!

On Wed, 3 Jan 2018 22:56:33 +0100, Johannes Schmitz wrote:

> >  - What is your Buildroot configuration ?
> >
> >  - What is the exact MIPS processor you're running this on ?
> >
> >  - Does it work when --disable-mipsfpu is passed, or when
> >    --enable-mipsfpu is passed ?
> >  
> 
> - glibc toolchain

I need the exact Buildroot .config file, to see which specific CPU you
have chosen, and other configuration knobs.

> - It does work when --disable-mipsfpu is forced

OK.

> - See hardware information here: https://elinux.org/CI20_Hardware
> 
> - additional FPU related information we found during the discussion:
> https://dmz-portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#10.5.2._Setting_the_FPU_mode

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
