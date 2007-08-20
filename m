From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 20 Aug 2007 15:57:09 +0100
Subject: [Buildroot] AVR32 now requires setting the kernel binary format
Message-ID: <d6cda7730708200757g18983a3clf5833aba059aee9e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

  Not sure if this is intended, but now to build the AVR32 one has to
set the kernel format in menuconfig, since the default changed from
uImage to zImage and the AVR32 linux fails to build zImage with
unknown target.

  Perhaps some variable missing in target/devices/Atmel

Cheers,
   Thiago A. Correa
