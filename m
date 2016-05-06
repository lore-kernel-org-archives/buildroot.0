From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 6 May 2016 09:02:40 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
 host-dtc for the host package
In-Reply-To: <20160505214432.GC4367@free.fr>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <20160505220901.4db9e9a2@free-electrons.com>
 <1040860357.13861098.1462480371842.JavaMail.zimbra@datacom.ind.br>
 <20160505212716.GA4367@free.fr> <20160505233851.26f9854f@free-electrons.com>
 <20160505214432.GC4367@free.fr>
Message-ID: <897552526.13921419.1462536160384.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org, "Arnout Vandecappelle" <arnout@mind.be>, "Peter
> Korsgaard" <peter@korsgaard.com>
> Sent: Thursday, May 5, 2016 6:44:32 PM
> Subject: Re: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on host-dtc for the host package

> Thomas, All,
> 
> On 2016-05-05 23:38 +0200, Thomas Petazzoni spake thusly:
>> On Thu, 5 May 2016 23:27:16 +0200, Yann E. MORIN wrote:
>> > However, given how pervasive DTC is becoming, I think it would kinda
>> > make sense to have a mkimage that supports DT every time (I hope that
>> > adding DT support to mkimage does not remove functionality, does it?)
>> 
>> Read again in which cases mkimage needs host-dtc. It is *NOT* related
>> to Device Tree at all. It is related to the FIT image format, which
>> happens to rely on the Device Tree syntax and compiler, but has
>> *nothing* to do with the Device Tree being used by the kernel to get a
>> description of the HW.
> 
> Oh, OK.
> 
> /me unconsciously associated dtc with generating DTB. But if it can be
> used for other things as well...
> 
> Then option 2 is the best solution IMHO.

Done (see patch v2).

Carlos Santos (Casantos)
DATACOM, P&D
