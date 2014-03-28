From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Mar 2014 14:37:12 +0100
Subject: [Buildroot] Xenomai support for pre and post patches
In-Reply-To: <CAEbDrgm2y0LM+Y1zF=976y2AyOUEJZqgHrwqSa9W+cu2WwGKFA@mail.gmail.com>
References: <CAEbDrgmqihPwKwxhr-WGQmAShN2Ahr7SsovCXgLgbtDUz+RWgg@mail.gmail.com>
 <CAEbDrgk-oaAJgHv=w02Hdzef9t7zphqWKBuq87eyD=FWHrA=Aw@mail.gmail.com>
 <20140328120909.260739cf@skate>
 <CAEbDrgm2y0LM+Y1zF=976y2AyOUEJZqgHrwqSa9W+cu2WwGKFA@mail.gmail.com>
Message-ID: <20140328143712.31e3f365@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 28 Mar 2014 13:31:31 +0000, Gregory Dymarek wrote:

> With your instructions I can see how to define the PRE patch (one that
> is applied to kernel before Xenomai Adeos patch). However, there are
> number of boards that require POST patch. A post patch is one that has
> to be applied to kernel after Xenomai Adeos patch.
> 
> The examples are: raspberry, zynq, beaglebone, mxc

Make a patch that applies to the Xenomai sources, and which adds the
necessary bits *inside* the kernel patches that Xenomai is applying to
the kernel. So you'll need a patch of a patch :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
