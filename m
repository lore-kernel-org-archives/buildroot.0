From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 6 May 2015 00:14:56 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
	3.10.17-1.0.1
In-Reply-To: <20150505111326.72efc84c@free-electrons.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
 <20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
 <20150505101021.09a0a96e@free-electrons.com>
 <CAAMH-ysr3OCUScHsnTFzusXpNKRDVJsn+z7S0a3RN-JVskXhNg@mail.gmail.com>
 <20150505111326.72efc84c@free-electrons.com>
Message-ID: <CAAMH-ysOC7LaP6msJjWaQGoCoy=z1Hn1sqwzvnm9N0KLuD=Hnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Antoine, Jerome, All

On Tue, May 5, 2015 at 11:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Gary,
>
> On Tue, 5 May 2015 11:07:59 +0200, Gary Bisson wrote:
>
>> > Well, you're only looking at boards that have a defconfig in Buildroot.
>> > But I'm pretty sure there are lots of people using Buildroot on custom
>> > i.MX6 boards, which may not necessarily be supported by all kernel
>> > versions.
>>
>> Sure but the other way around applies too, like what Antoine had to do
>> when working on a 3.10.53 kernel.
>
> Absolutely, but if the 3.10.53-compatible GPU drivers also work with
> 3.10.17, then we would have a situation where one single version of the
> GPU drivers can address both 3.10.17 and 3.10.53 based configurations.
> While what we have today only works for 3.10.17 based configurations.

Actually this is not the case, 3.10.53 gpu libs are not compatible
with 3.10.17 kernels, see the meta-fsl mailing list links below.
https://lists.yoctoproject.org/pipermail/meta-freescale/2015-April/013234.html
https://lists.yoctoproject.org/pipermail/meta-freescale/2015-April/013267.html

But the good news is that 3.14.28 and 3.10.53 kernels/libs are
compatible, so we could update to the 3.14.28 GA release directly.

Regards,
Gary
