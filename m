From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Aug 2016 22:34:07 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <1470671781.31195.45.camel@synopsys.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
 <1470671781.31195.45.camel@synopsys.com>
Message-ID: <20160808223407.4f535efd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Aug 2016 15:56:21 +0000, Vlad Zakharov wrote:

> The failures listed above occurred due to the same issue -
> crtbeginT.o file was missing as the corresponding dependency wasn't
> added. The issue has already been solved internally and will be
> included in our next engineering build. We hope that new build happen
> tomorrow or the day after tomorrow. Anyway we will send patch patch
> with bumping to new arc toolchain as soon as it will come up.

OK, thanks!

> > > Looking for C++ compiler... ./configure: line 110: eval: -g:
> > > invalid option eval: usage: eval [arg ...]
> > > ./configure: line 110: eval: -c: invalid option
> > > eval: usage: eval [arg ...]  
> >   
> 
> I am looking at this issue now. I will report about it ASAP.

Perfect, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
