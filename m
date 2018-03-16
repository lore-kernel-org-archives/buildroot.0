From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 10:52:54 +0000
Subject: [Buildroot] [PATCH 4/4] package/rpi-firmware: improve
 installation of dtb files
In-Reply-To: <D04562A3-E6F9-44CB-862F-AD1B3D6D9941@jens-maus.de>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <1521120291-15781-4-git-send-email-martin@barkynet.com>
 <20180315204022.58ee68fc@gmx.net>
 <CAFGQKxfa0L=bTWtPQV9HNFOP6Wox3BTX-p_gyp+aF0PQoPK5-Q@mail.gmail.com>
 <20180315215947.GA26659@scaer>
 <CAFGQKxcvdNOy8Fxku3kwhJjMz+T5dnqz3oY3gYEB7er7t8Gc1A@mail.gmail.com>
 <D04562A3-E6F9-44CB-862F-AD1B3D6D9941@jens-maus.de>
Message-ID: <CAFGQKxdXDVU_yWcrsiawYR2-=a7=FAp34=AOqB4EXXTCCyH7sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jenus,

On 16 March 2018 at 09:32, Jens Maus <mail@jens-maus.de> wrote:
> BTW: As you seem to push updates regarding Pi3+ I have some more patches at hand for you :)
>
> https://github.com/jens-maus/RaspberryMatic/blob/master/buildroot-patches/0003-rpi-wifi-firmware.patch
> https://github.com/jens-maus/RaspberryMatic/blob/master/buildroot-patches/0004-wiringpi.patch
>
> The first is to actually get WiFi working again because the NVRAM settings file is different for the new WiFi chip of the Pi3+. The second updates the wiringpi package to the latest master version which fixes compatibility to the Pi3+.
>
> Sorry that I am not able to submit these patches myself via patchwork to buildroot, but my time is unfortunately limited these days. However, feel free to submit these patches yourself.

Yes I'm happy to submit a patch to update rpi-wifi-firmware.  I have a
rpi3b+ now so i can test this.  I don't use wiringpi so i think it
might be better if someone else more familiar with the package updates
it.

For some reason my v2 patch set disappeared into /dev/null in
patchwork.   I'll include the updates to rpi-wifi-firmware and submit
a v3 patchset.

Thanks

Martin

>
> Regards,
> Jens

[--SNIP--]

>
> --
> Jens Maus, Dresden/Germany
> http://jens-maus.de/
>
> *** Content is authentic only with digital signature  ***
>
