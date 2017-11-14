From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 14 Nov 2017 12:11:58 +0100
Subject: [Buildroot] xf86-video-armsoc
In-Reply-To: <20171114110844.ut5udekj5wibzbim@flea.lan>
References: <3bdc214f-ee7b-85c1-5794-85b1c28ef9a9@micronovasrl.com>
 <20171114110844.ut5udekj5wibzbim@flea.lan>
Message-ID: <5003d938-9aff-9c9e-f49e-9f8639edba66@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 14/11/2017 12:08, Maxime Ripard ha scritto:
> Hi,
> 
> On Mon, Nov 13, 2017 at 08:00:40PM +0100, Giulio Benetti wrote:
>> to get r6p2 mali openGL working with X11 DMA_BUF,
>> do I need xf86-video-armsoc?
> 
> Yes, from here:
> https://github.com/mripard/xf86-video-armsoc
> 
> You'll also need that patch:
> https://github.com/NextThingCo/linux/commit/e390023d73a8dcbea85e5156e3930e37ca431472
> 
> But I'm not sure this is wise to add support for it in buildroot. That
> ioctl will never be merged in the upstream kernel.

So what could be the right way to keep up to date with upstream kernel?

> 
> Maxime
> 

Thank you pointing me to that


-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
