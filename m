From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Aug 2016 22:59:23 +0200
Subject: [Buildroot] [PATCH 0/3] Fix our defconfigs (branch
 yem/fix-defconfigs)
In-Reply-To: <20160807225419.443e606c@free-electrons.com>
References: <cover.1470602446.git.yann.morin.1998@free.fr>
 <20160807225419.443e606c@free-electrons.com>
Message-ID: <20160807205923.GJ5855@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-07 22:54 +0200, Thomas Petazzoni spake thusly:
> On Sun,  7 Aug 2016 22:44:33 +0200, Yann E. MORIN wrote:
> >       defconfigs/kb9202: fix headers version
> >       defconfigs/snps_axs_10*: uboot needs dtc
> >       pcakage/uclibc: fix build on thumb2-only arm cpus
> All three applied. If not already done, please make sure to report on
> the uclibc mailing list the thumb2 problem.

Sure, I was about to do so...

> BTW, now that I re-read your commit log, it's wrong: the SAMA5 are not
> at all Thumb2 only CPUs. They are regular Cortex-A5 CPUs, i.e they
> support both Thumb-2 and ARM.

Right, what I meant to say was that it is fixing our thumb2 defconfigs.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
