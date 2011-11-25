From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2011 13:47:12 +0100
Subject: [Buildroot] uboot patch file location ??
In-Reply-To: <141715BD74664D68A40946332371F408@JohanW7>
References: <141715BD74664D68A40946332371F408@JohanW7>
Message-ID: <20111125134712.7d240a35@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 25 Nov 2011 13:13:25 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> What should the correct  path file path be ?

It should be board/UBOOT/2010.12/ according to what you said.

However, note that this isn't really how board/ is supposed to be used.
The suggestion is not create a directory hierarchy as follows :

 board
 +- <yourcompany>
    +- <yourproject>
      +- u-boot-patches
      +- linux-patches

See also
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf, page
18 to 21.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
