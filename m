From: Jens Maus <mail@jens-maus.de>
Date: Fri, 16 Mar 2018 14:12:17 +0100
Subject: [Buildroot] [PATCH 4/4] package/rpi-firmware: improve
 installation of dtb files
In-Reply-To: <CAFGQKxdXDVU_yWcrsiawYR2-=a7=FAp34=AOqB4EXXTCCyH7sg@mail.gmail.com>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <1521120291-15781-4-git-send-email-martin@barkynet.com>
 <20180315204022.58ee68fc@gmx.net>
 <CAFGQKxfa0L=bTWtPQV9HNFOP6Wox3BTX-p_gyp+aF0PQoPK5-Q@mail.gmail.com>
 <20180315215947.GA26659@scaer>
 <CAFGQKxcvdNOy8Fxku3kwhJjMz+T5dnqz3oY3gYEB7er7t8Gc1A@mail.gmail.com>
 <D04562A3-E6F9-44CB-862F-AD1B3D6D9941@jens-maus.de>
 <CAFGQKxdXDVU_yWcrsiawYR2-=a7=FAp34=AOqB4EXXTCCyH7sg@mail.gmail.com>
Message-ID: <51037E82-F81A-408A-97E7-F5EA9001B9EB@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 16.03.2018 um 11:52 schrieb Martin Bark <martin@barkynet.com>:
> 
> Yes I'm happy to submit a patch to update rpi-wifi-firmware.  I have a
> rpi3b+ now so i can test this.  I don't use wiringpi so i think it
> might be better if someone else more familiar with the package updates
> it.

My patch for wiringpi is quite straight forward and ?just? updates to the latest 2.46 version recently released including necessary patches to the build process patch. IMHO they are quite a no-brainer and can be integrated without any bigger hassle. Thus, it would be great if someone could generate the necessary patchwork stuff accordingly.

Regards,
Jens
-- 
Jens Maus, Dresden/Germany
http://jens-maus.de/

*** Content is authentic only with digital signature  ***

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3745 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180316/2c74c297/attachment.p7s>
