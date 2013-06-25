From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:37:50 +0200
Subject: [Buildroot] Some issues found while trying to add JimTcl to
 buildroot
In-Reply-To: <CALF0-+Wv84PKHfz8XzfEBEmprrtOfBF+Szqy8ATZ4y0x3xpsjg@mail.gmail.com>
References: <CALF0-+V5oWQ_zo6pzs8WOEj02H2Q9W7rzBvioabK0u_nuAaXDg@mail.gmail.com>
 <20130625212043.3d224da3@skate>
 <CALF0-+Wv84PKHfz8XzfEBEmprrtOfBF+Szqy8ATZ4y0x3xpsjg@mail.gmail.com>
Message-ID: <20130625213750.63247a3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Tue, 25 Jun 2013 16:29:05 -0300, Ezequiel Garcia wrote:

> > Any reason not to use it? This patch is also in our patchwork at
> 
> Well, on a very first look I need the libjim.a to embed the
> interpreter inside an application.
> Sadly, the shell is useless in this case. I'll see if I can work on
> top of Gustavo's patch
> and install the library and the headers.

Ok.


> > TARGET_MAKE_ENV already sets a PATH variable that has the toolchain
> > directory in it. See package/Makefile.in for the definition of
> > TARGET_MAKE_ENV.
> 
> Cool, thanks.
> 
> I'll take a closer look to this, and to Gustavo's patch and let you both know.

Don't hesitate to take Gustavo patch, make the necessary
fixes/improvements and resend it with your Acked-by. Maybe that will
push Peter into merging Gustavo's patch :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
