From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 26 Jun 2019 09:34:14 +0200
Subject: [Buildroot] [PATCH v4 08/15] package/gcc: switch to gcc 8.x as
 the default
In-Reply-To: <20190626092335.4f81ec27@windsurf>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-9-giulio.benetti@micronovasrl.com>
 <20190622214410.4bc6022e@windsurf>
 <29b577b0-8c65-7038-929b-ad2828ec7495@gmail.com>
 <20190623182145.459e0154@windsurf>
 <1892475d-542b-7c52-26c7-193f9749d347@mind.be>
 <e0eb8f67-30b1-66ae-90ae-d2439a3ec631@smile.fr>
 <20190626092335.4f81ec27@windsurf>
Message-ID: <fd188700-e2d5-52d2-d58e-2c50c24a08e8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Hi Thomas,

Le 26/06/2019 ? 09:23, Thomas Petazzoni a ?crit?:
> On Wed, 26 Jun 2019 08:55:00 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> Note: gcc 5 is still used by beaglebone_qt5_defconfig in order to test the SGX
>> PowerVR GPU using TI's sgx demo package.
>> This defconfig doesn't seems maintained for a long time (compared to
>> beaglebone_defconfig). I'm adding Lothar Felten in Cc.
>>
>> Lothar: it would be great if you can have a look at this defconfig and try to
>> use gcc 8 (or at least gcc 7).
> 
> Lothar did quite a bit of work on this, but we had the issue of the GBM
> API, where I tried to do a virtual package, but it didn't work well,
> Lothar did further experiments with Qt with GBM, and it worked, but I
> never had the chance to have a look.

I used git log for having the history on this defconfig, the drawback of this
method is I'm missing all work that is not merged yet.
I wasn't aware of Lothar's work, sorry.
> 
> So, I wouldn't blame Lothar for not updating the defconfig here :-)

I don't blame Lothar for not updating this defconfig, I understand working on
TI's SGX packages is difficult :)
My intention is to notify Lothar that we are going to remove gcc 5.x.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
