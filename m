From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 12:53:14 +0100
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <511A2C3B.70604@relinux.de>
References: <20130209004253.207e0741@skate> <511A19A8.4020307@relinux.de>
 <20130212113628.00ce121d@skate> <511A2C3B.70604@relinux.de>
Message-ID: <20130212125314.41bfdbf2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Tue, 12 Feb 2013 12:49:15 +0100, Stephan Hoffmann wrote:

> > Why don't you build your external toolchain once, put it in a
> > tarball, and then point Buildroot to it?
> Because, as I wrote, I like the concept to have it integrated in
> buildroot's configuration.

It's integrated in your configuration: your Buildroot configuration
says "use toolchain from http://foobar.com/toolchain.tar.gz", and
that's it.

> >  You have to do this only once, and you
> > can even put your toolchain tarball on a server so that others can
> > use it without having to rebuild the toolchain.
>
> What's the advantage of your proposal against using ct-ng to build the
> toolchain or use a prepared one from somewhere else?

There's no advantage because my proposal is exactly what you state
here: prepare a toolchain first (could be with Buildroot, with ct-ng,
or some other pre-existing toolchain), and use it with Buildroot as an
external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
