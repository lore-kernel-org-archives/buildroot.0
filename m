From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Oct 2020 23:29:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-gpu-viv: fix
 build issue with Wayland backend
In-Reply-To: <20201020212045.GJ3466@scaer>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-3-gary.bisson@boundarydevices.com>
 <20200402162543.595ed9e7@windsurf.home>
 <20200402151026.GA934730@p1g2> <20200708122048.GB331830@p1g2>
 <CAEyMn7ZM4Stiud_M2tnK=t-Z7Azot5LxBX9_kzxFUXgFqxikpg@mail.gmail.com>
 <20201020212045.GJ3466@scaer>
Message-ID: <20201020212909.GK3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, Heiko, Thomas,  All,

On 2020-10-20 23:20 +0200, Yann E. MORIN spake thusly:
> On 2020-10-13 20:30 +0200, Heiko Thiery spake thusly:
> > Am Mi., 8. Juli 2020 um 14:20 Uhr schrieb Gary Bisson
> > <gary.bisson@boundarydevices.com>:
> > > Gentle ping on this, let me know if you see another approach that would
> > > be better, I'm open to suggestions.
> So, we've discussed and investigated this with Heiko on IRC tonight, and
> we came to the conclusion that the weston build failure is a weston bug.
[--SNIP--]

I forgot to say:

As a consequence, I marked this patch as "changes requested" in patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
