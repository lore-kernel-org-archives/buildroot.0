From: John Stile <john@stilen.com>
Date: Fri, 25 Jan 2013 13:13:38 -0800
Subject: [Buildroot] can I build two copies of uboot in buildroot?
Message-ID: <1359148418.7974.65.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have hacked at91bootstrap to select and boot one of two copies of
uboot+env on a NAND flash, but I had to compile the second uboot my
self, since the environment address is set at compile time, and
buildroot only builds one copy of uboot.  

How might I hack uboot to build two different copies of uboot?  I'm just
changing the address location of the uboot environment, and saving the
image as a different name.

I wasn't able to figure out how to make the uboot environment address a
parameter to uboot, so I also haven't tried to have at91bootstrap call
uboot with this parameter, but that might be easier.
