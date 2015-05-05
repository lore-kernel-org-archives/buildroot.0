From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 11:13:26 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
 3.10.17-1.0.1
In-Reply-To: <CAAMH-ysr3OCUScHsnTFzusXpNKRDVJsn+z7S0a3RN-JVskXhNg@mail.gmail.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
 <20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
 <20150505101021.09a0a96e@free-electrons.com>
 <CAAMH-ysr3OCUScHsnTFzusXpNKRDVJsn+z7S0a3RN-JVskXhNg@mail.gmail.com>
Message-ID: <20150505111326.72efc84c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Tue, 5 May 2015 11:07:59 +0200, Gary Bisson wrote:

> > Well, you're only looking at boards that have a defconfig in Buildroot.
> > But I'm pretty sure there are lots of people using Buildroot on custom
> > i.MX6 boards, which may not necessarily be supported by all kernel
> > versions.
> 
> Sure but the other way around applies too, like what Antoine had to do
> when working on a 3.10.53 kernel.

Absolutely, but if the 3.10.53-compatible GPU drivers also work with
3.10.17, then we would have a situation where one single version of the
GPU drivers can address both 3.10.17 and 3.10.53 based configurations.
While what we have today only works for 3.10.17 based configurations.


> Antoine, do you have a patch ready for the GPU package? Because it
> seems that it's not just a version bump:
> https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9639f6f20991ab64ea75177a017f8749a

Yes, Antoine does have such thing. Can you share it with Gary?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
