From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Oct 2012 17:43:10 +0100
Subject: [Buildroot] Load Address and EntryPoint for Kernel
In-Reply-To: <508D5B55.1070401@googlemail.com>
References: <508D5B55.1070401@googlemail.com>
Message-ID: <20121028174310.34c4f029@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 28 Oct 2012 17:20:37 +0100, Carsten Schoenert wrote:

> I have search the point there I can change this while mkimage is called
> to generate the uImage but haven't found the correct point for this.
> 
> Can someone give me a hint?

Most likely your kernel configuration is wrong.

Please post your Buildroot .config and kernel .config file and more
details about what your hardware platform is.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
