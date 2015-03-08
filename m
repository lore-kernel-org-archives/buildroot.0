From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:41:47 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <20150307172039.GI3937@waldemar-brodkorb.de>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307172039.GI3937@waldemar-brodkorb.de>
Message-ID: <20150308084147.4be140e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, Alexey,

On Sat, 7 Mar 2015 18:20:39 +0100, Waldemar Brodkorb wrote:

> I am still unsatisfied about the ARC situation.
> If you use this branch of gcc:
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-4.8-tls
> 
> You get a working toolchain with TLS support and can use uClibc-git
> or uClibc-ng 1.0.0 with NPTL.

I'm adding Alexey from Synopsys in Cc. Alexey, when do you think we can
switch to a gcc version that has TLS support in Buildroot, for the ARC
architecture ?

This would allow us to enable NPTL on ARC, using uClibc-ng.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
