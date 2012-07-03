From: Judson Wilson <judson@powerstandards.com>
Date: Tue, 03 Jul 2012 10:13:29 -0700
Subject: [Buildroot] Linux throwing "uncompression error" on
 rootfs.ext2.gz ?
In-Reply-To: <20120703093103.563a1876@skate>
References: <4FF24364.7010303@powerstandards.com>
 <20120703093103.563a1876@skate>
Message-ID: <4FF32839.2070505@powerstandards.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Are you using this file as an initrd, or as the real root filesystem?
> Could you share some details about your setup (where do you put the
> ext2.gz image, what is your kernel command line, kernel configuration,
> etc.).
>
> Thomas

You asked the right questions! Turns out I was not expanding my U-Boot 
serial flash read commands to match my new larger flash partitions and 
images - so only part of the image was getting copied to RAM.

Thank you for the help!

- Judson
