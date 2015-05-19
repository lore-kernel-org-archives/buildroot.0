From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 19 May 2015 19:57:09 +0200
Subject: [Buildroot] [PATCH v3 0/9] configs: defconfigs for Atmel boards
In-Reply-To: <20150519174404.5d19d2cf@free-electrons.com>
References: <1432045308-16825-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20150519174404.5d19d2cf@free-electrons.com>
Message-ID: <20150519175709.GA3338@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 19/05/2015 at 17:44:04 +0200, Thomas Petazzoni wrote :
> Dear Alexandre Belloni,
> 
> On Tue, 19 May 2015 16:21:39 +0200, Alexandre Belloni wrote:
> 
> > Changes in v3:
> >  - select 3.18 headers for the toolchain
> >  - rename the documentation
> >  - update the flasher helper to support more boards
> >  - update the tcl script to the latest version from Atmel (demos v4.7)
> >    It has better debug messages and takes the dtb filename as a parameter
> >    It also supports giving different video modes to support the DRM/KMS display driver
> 
> Ah, so the TCL script is available somewhere upstream? In this case,
> why don't we create a simple Buildroot package to download it and
> install it somewhere, instead of having it copy/pasted inside Buildroot?
> 

It is not really available per se. It is distributed alongside with the
demos in a 160MB and more often than not is only aimed at supporting the
specific SoC supported by the demo.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
