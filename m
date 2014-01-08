From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 8 Jan 2014 16:57:48 +0100
Subject: [Buildroot] [PATCH 2/5] toolchain/external: fix wrapper by not
 passing conflicting flags
In-Reply-To: <20140108235132.2e741f4a@skate>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <5d0fbb9b1f4439750dde9bb7788b273ec94a3bd5.1389134731.git.yann.morin.1998@free.fr>
 <CAGduivx327zJ_Vy=NDzE9pQKBEkd+OPWHLw2SOYaHACMtvX07Q@mail.gmail.com>
 <20140108235132.2e741f4a@skate>
Message-ID: <CAGduivw60X1M=cG9xx_ZJqVOgnKB5C7DpfduEwLJD+j0r46sSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 8, 2014 at 4:51 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
Hi Thomas,
>
> On Wed, 8 Jan 2014 13:45:59 +0100, Maxime Hadjinlian wrote:
>
>> Shouldn't we change the different defconfig that exists ? At least the
>> RaspberryPi so it would sets an example (and maybe add something about
>> this in the manual ?)
>
> Why would the defconfig need some changes following this patch?
To set a visible example of settings the correct -march/mcpu/mtune options ?
Also, this would eliminate all the warnings that Yann saw while
building a kernel for the rpi, so it seems like a good candidate.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
