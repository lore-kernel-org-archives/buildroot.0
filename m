From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 13 May 2019 14:38:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-12
In-Reply-To: <20190513135520.6ced2ff2@windsurf.home>
References: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
 <20190513135520.6ced2ff2@windsurf.home>
Message-ID: <d48f8cd4-3d8f-c6f6-4d08-6195f304cbfa@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 13/05/2019 13:55, Thomas Petazzoni ha scritto:
> Hello,
> 
> Giulio, Matt, Vadym, Gilles, Peter, Adrian, there are some
> questions/topics/issues for you below!
> 
> On Mon, 13 May 2019 06:00:37 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>        branch |  OK | NOK | TIM | TOT |
>>     2019.02.x |  30 |   1 |   0 |  31 |
>>        master | 177 |  11 |   5 | 193 |
> 
> Results are not too bad, but we have a fairly high number of timeouts,
> which is not nice. Let's have a look at the details.
> 
>> microblazeel |                           atop | TIM | http://autobuild.buildroot.net/results/94aa00f776b8a3491ac0b3212c95f5e666c5a29a |
> 
> This seems weird. Happened when linking a fairly simple application,
> never had another timeout on that package.
> 
> Giulio, could you try to re-run the exact same defconfig (using
> br-reproduce-build) and see if it's reproducible ?

Actually I'm experiencing timeout both on my pc and my server.
Launching htop I've found it hangs while:
/home/giuliobenetti/br_reproduce/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/output/host/libexec/gcc/microblazeel-buildroot-linux-uclibc/7.4.0/cc1 
-quiet -isysroot 
/home/giuliobenetti/br_reproduce/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/output/host/microblazeel-buildroot-linux-uclibc/sysroot 
-D _LARGEFILE_SOURCE -D _LARGEFILE64_SOURCE -D _FILE_OFFSET_BITS=64 -D 
_LARGEFILE_SOURCE -D _LARGEFILE64_SOURCE -D _FILE_OFFSET_BITS=64 
showgeneric.c -quiet -dumpbase showgeneric.c -auxbase-strip 
showgeneric.o -g2 -O2 -o /tmp/ccPqa6b0.s

With 1 core at 100%

Is there a way to understand why?

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
