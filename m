From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Mar 2017 19:22:09 +0200
Subject: [Buildroot] [PATCH 2/2] ti-uim: bump to latest version
In-Reply-To: <20170309075330.vauudriqhipx3cq2@piout.net>
References: <af8528c725dbee3b80a8a99b2adba50a6ff4114d.1489038337.git.baruch@tkos.co.il>
 <075bbc11df38f8280c99d15834ec461dad0d6654.1489038337.git.baruch@tkos.co.il>
 <20170309075330.vauudriqhipx3cq2@piout.net>
Message-ID: <20170309172209.k76ucsihxbylnds6@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Thu, Mar 09, 2017 at 08:53:30AM +0100, Alexandre Belloni wrote:
> On 09/03/2017 at 07:45:37 +0200, Baruch Siach wrote:
> > Also, add a hash file.
> > 
> > Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Thanks.

> BTW, I don't think this daemon is necessary anymore with recent kernel
> but I don't exactly remember all the details.

It is unfortunately still needed. I just tested with kernel v4.10.1 on 
SolidRun i.MX6 uSOM rev 1.5 with the TI WL1831 BT/WiFi combo. Hopefully the 
newly introduced serdev bus (commit cd6484e1830b) would obviate the need for 
such a horrible hack at some future point.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
