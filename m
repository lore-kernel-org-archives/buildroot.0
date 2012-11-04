From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Nov 2012 18:53:01 +0100
Subject: [Buildroot] new perl build issue
In-Reply-To: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
Message-ID: <20121104185301.0616b2f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Khryukin,

Thanks for your report.

Fran?ois, would you mind looking into this?

Thanks!

Thomas

On Sun, 4 Nov 2012 20:02:22 +0300, Alexander Khryukin wrote:
> Hi.
> I'm trying to build new perl package
> and get error
> http://pastie.org/5181814
> 
> 
> FATAL: kernel too old
> The program compiled OK, but exited with status 1.
> You have a problem.  Shall I abort Configure [y]
> Ok.  Stopping Configure.
> 
> Looks like perl package get kernel version string via uname or /proc
> 2.6.32-279.9.1.el6.x86_64 my kernel



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
