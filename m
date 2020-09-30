From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Sep 2020 22:03:24 +0200
Subject: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 add missing glibc toolchain dependencies
In-Reply-To: <20200928222330.395b681a@windsurf.home>
References: <20200927143752.1498115-1-romain.naour@gmail.com>
 <20200927143752.1498115-2-romain.naour@gmail.com>
 <20200928222330.395b681a@windsurf.home>
Message-ID: <37e6d195-4919-d6e8-56a7-356ac81d750b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 28/09/2020 ? 22:23, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sun, 27 Sep 2020 16:37:51 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> glibc toolchains must be disabled for MMU less configuration.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> I am wondering if this one really makes sense. If there is a Bootlin
> toolchain that exists for a given architecture, then it really does
> exist. So adding another BR2_USE_MMU dependency here feels useless, no?

Indeed, It just about being in sync with BR2_TOOLCHAIN_BUILDROOT_GLIBC dependencies.

Ok if you want to drop it.

Best regards,
Romain


> 
> Thomas
> 
