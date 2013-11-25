From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Nov 2013 10:35:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-22
In-Reply-To: <CAAXf6LVk0j9C0GS=qUeEdcyKvB64vc4AEPPHBptnSFtdVX5ukw@mail.gmail.com>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
 <20131123182656.77936e93@skate>
 <CAAXf6LVk0j9C0GS=qUeEdcyKvB64vc4AEPPHBptnSFtdVX5ukw@mail.gmail.com>
Message-ID: <20131125103530.776caae4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 25 Nov 2013 10:26:46 +0100, Thomas De Schampheleire wrote:

> > It's a fairly old toolchain that I've built with Crosstool-NG. It uses
> > uClibc 0.9.33.2, but there might be some missing uClibc configuration
> > options, or the kernel headers might be old.
> 
> Then what do we do? Does it make sense to use this old toolchain, or
> should we update it?

It's on my TODO-list to update all the toolchains used in the
autobuilders. I've rebuilt all the Buildroot toolchains already, and
prepared the configs for the Crosstool-NG toolchains as well. Just need
a bit of time to finalize this (I have been working on SELinux patches
yesterday evening with Ryan and Clayton).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
