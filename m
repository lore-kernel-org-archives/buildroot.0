From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 29 Apr 2009 20:55:57 -0300
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
Message-ID: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   The 2009.03 and possibly 2009.01 u-boot releases have a problem
with JFFS2. Looks like it's not really platform specific, but it
affects the AVR32 boards [1].
   Not sure if it's connected, but also flinfo presents wrong addresses.

   I'm seeing this with 2009.03, but the message[1] talks about 2009.01
   Is anyone else having these problems? I've just flashed 2008.10 and
it works properly.

   Should we deal with 2009.03 and 2009.01 in any special way? (Drop
them, comment as broken JFFS2?)

[1] http://www.mail-archive.com/u-boot at lists.denx.de/msg09872.html

Kind Regards,
   Thiago A. Correa
