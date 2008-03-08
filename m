From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 8 Mar 2008 10:24:18 -0300
Subject: [Buildroot] Problem with _defconfig's
Message-ID: <d6cda7730803080524k3be8278aw4a2794c83eebc68@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I was just about to try the new HEAD additions but I was unable to
use any defconfig for the AVR32: Anyone with the same isues?

localhost buildroot # make atngw100-base_defconfig
make: *** No rule to make target `atngw100-base_defconfig'.  Stop.
localhost buildroot # make atngw100-expanded_defconfig
make: *** No rule to make target `atngw100-expanded_defconfig'.  Stop.
localhost buildroot # make atstk1002_defconfig
make: *** No rule to make target `atstk1002_defconfig'.  Stop.


Regards,
   Thiago A. Correa
