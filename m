From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Mar 2017 23:32:12 +0100
Subject: [Buildroot] [PATCH 4/6] python-mwscrape: use documented license
 abbreviation
In-Reply-To: <20170322213900.3ace3cc4@free-electrons.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1490204935-13172-4-git-send-email-rahul.bedarkar@imgtec.com>
 <20170322213900.3ace3cc4@free-electrons.com>
Message-ID: <20170322223212.GA3591@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-22 21:39 +0100, Thomas Petazzoni spake thusly:
> On Wed, 22 Mar 2017 23:18:53 +0530, Rahul Bedarkar wrote:
> 
> >  PYTHON_MWSCRAPE_VERSION = 6a58d7801eb1e884fd0516f1adbedbd4481c10e6
> >  PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
> > -PYTHON_MWSCRAPE_LICENSE = MPL-2.0
> > +PYTHON_MWSCRAPE_LICENSE = MPLv2.0
> 
> Well, our idea was to use the SPDX license codes as much as possible,
> and MPL-2.0 is the correct SPDX license code for this license. However,
> it is true we haven't used SPDX from the beginning, so we're using
> GPLv2 everywhere, while SPDX uses GPL-2.0.
> 
> See:
> 
>   https://spdx.org/licenses/
> 
> I think our idea was to keep using GPLv2/LGPLv2.1/GPLv3, but for all
> other licenses, use the SPDX code as much as possible.
> 
> Maybe we should bite the bullet, and migrate all packages to use SPDX
> license codes?

That would have my approval, yes.

Regards,
Yann E. MORIN.

> Arnout, Yann, Peter?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
