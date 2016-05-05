From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 May 2016 23:44:32 +0200
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add missing dependency on
 host-dtc for the host package
In-Reply-To: <20160505233851.26f9854f@free-electrons.com>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <20160505220901.4db9e9a2@free-electrons.com>
 <1040860357.13861098.1462480371842.JavaMail.zimbra@datacom.ind.br>
 <20160505212716.GA4367@free.fr>
 <20160505233851.26f9854f@free-electrons.com>
Message-ID: <20160505214432.GC4367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-05-05 23:38 +0200, Thomas Petazzoni spake thusly:
> On Thu, 5 May 2016 23:27:16 +0200, Yann E. MORIN wrote:
> > However, given how pervasive DTC is becoming, I think it would kinda
> > make sense to have a mkimage that supports DT every time (I hope that
> > adding DT support to mkimage does not remove functionality, does it?)
> 
> Read again in which cases mkimage needs host-dtc. It is *NOT* related
> to Device Tree at all. It is related to the FIT image format, which
> happens to rely on the Device Tree syntax and compiler, but has
> *nothing* to do with the Device Tree being used by the kernel to get a
> description of the HW.

Oh, OK.

/me unconsciously associated dtc with generating DTB. But if it can be
used for other things as well...

Then option 2 is the best solution IMHO.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
