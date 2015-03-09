From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 10:46:48 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <1425889628.5234.11.camel@synopsys.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307172039.GI3937@waldemar-brodkorb.de>
 <20150308084147.4be140e3@free-electrons.com>
 <1425889628.5234.11.camel@synopsys.com>
Message-ID: <20150309104648.2747fd11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 9 Mar 2015 08:27:09 +0000, Alexey Brodkin wrote:

> We're actively working on enabling TLS/NPTL support for ARC and our
> current plan is to get it done by the next release of ARC tools -
> sometime later this spring.
> 
> Even though most of things in TLS/NPTL tools for ARC work pretty well
> there're still issues to be resolved. And because this all is still in
> works we don't yet have particular branches in binutils and gcc repos I
> may recommend you to try.
> 
> As for uClibc we tend to apply all changes to "arc-mainline-dev" branch
> in "https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc"
> repo.
> 
> Still I'd propose to wait a bit until we get something that could be
> labeled as RC and then if you're willing to start running build or
> run-time tests I'll let you know.
> 
> Anyway once we enable TLS/NPTL in GNU tools for ARC I'll send patch that
> enables TLS for ARC in Buildroot - we're looking forward to having TLS
> as a default option for ARC (as most of other arches do) because of
> known benefits of TLS threading compared to Linuxthreads.
> 
> So stay tuned.

Thanks Alexey for this summary of TLS support in ARC, very useful. As
you suggest, we'll wait for the next release of the ARC tools to enable
TLS by default on ARC.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
