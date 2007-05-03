From: Diego A. Fons <diegofons@apexar.com>
Date: Thu, 03 May 2007 11:48:29 -0300
Subject: [Buildroot] No rule to make target
Message-ID: <4639F63D.8090902@apexar.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, it's me again...

Once i built tinyX using buildroot and an external toolchain i tried to 
build libgtk2 but i get this error:

make: *** No rule to make target `tinyx', needed by `cairo'.  Stop.

It seems that tinyX can't be built but i've already built tinyX in a 
previous make. Does anyone know how to fix it?

Thanks and regards,
Diego A. Fons.
