From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 14 Feb 2018 17:37:33 -0200 (BRST)
Subject: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3
In-Reply-To: <20180214133856.0b932d8a@windsurf.lan>
References: <20171215153830.4864-1-casantos@datacom.ind.br>
 <367239421.6256025.1513450988190.JavaMail.zimbra@datacom.ind.br>
 <1833448217.6256112.1513453992880.JavaMail.zimbra@datacom.ind.br>
 <20171217050554.5377c971@windsurf> <20180109105628.6bd70119@windsurf>
 <1044274388.21428.1515549369997.JavaMail.zimbra@datacom.ind.br>
 <1165835580.151356.1518608286300.JavaMail.zimbra@datacom.ind.br>
 <20180214133856.0b932d8a@windsurf.lan>
Message-ID: <1373112436.78108.1518637053844.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Romain Naour" <romain.naour@gmail.com>, "buildroot"
> <buildroot@buildroot.org>
> Sent: Wednesday, February 14, 2018 10:38:56 AM
> Subject: Re: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3

> Hello,
> 
> On Wed, 14 Feb 2018 09:38:06 -0200 (BRST), Carlos Santos wrote:
> 
>> >> In the end, did you get the chance to raise the issue of the tarball
>> >> name with the upstream developers ?
>> > 
>> > Thanks for reminding me of this issue. I just submitted a ticket:
>> > 
>> >    https://sourceforge.net/p/e1000/bugs/589/
>> 
>> No love, so far. :-(
> 
> I pinged on the bug report, just in case, but indeed, there isn't much
> hope.

So we cannot upgrade the package without some hack to like the one in

    https://patchwork.ozlabs.org/patch/849230/

It works, but uses $(DL_WRAPPER), which should be opaque to recipes.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
