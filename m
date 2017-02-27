From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 16:58:59 +0100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
 <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
Message-ID: <20170227165859.51c786a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 15:58:54 +0100, Arnout Vandecappelle wrote:

>  At least, if we do go the qemu-user way, it should always work, so also with
> musl and uClibc, also if host headers are older than target...

It simply cannot work with host headers older than the target headers,
by principle.

> But really, cross-compilation doesn't work at all (i.e. qemu is
> needed), and anyway doesn't work on the unusual architectures where
> Debian is not available, then I don't think Buildroot is the right
> way.

Do you meant "*if* cross-compilation doesn't work at all" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
