From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2008 17:48:24 +0200
Subject: [Buildroot] Kernel header installed with external toolchain ?
In-Reply-To: <87r668k5dk.fsf@macbook.be.48ers.dk>
References: <20081022171035.451de23c@surf> <87r668k5dk.fsf@macbook.be.48ers.dk>
Message-ID: <20081022174824.1aba1ece@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Oct 2008 17:37:43 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> Hi,
>  Thomas> I'm using Buildroot with an external toolchain, but after
>  Thomas> every cleanup of the tree, the next 'make' will trigger the
>  Thomas> download of the kernel source code and the installation of
>  Thomas> kernel headers. I'm wondering why this is necessary, since
>  Thomas> the external toolchain already have the headers.
> 
> It shouldn't redownload unless you remove your dl dir.

Yes, you're right, sorry. It doesn't redownload, but re-extract, and
re-install them.

> Sounds like it. Sorry, I'm not using the external toolchain stuff, but
> patches are welcome.

Ok, will try to dig into this someday.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
