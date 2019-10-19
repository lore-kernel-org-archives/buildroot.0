From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Oct 2019 15:23:06 +0200
Subject: [Buildroot] [PATCH] package/libseccomp: circumvent uClibc-ng
 bug on x86_64
In-Reply-To: <4154F3C2-1876-461A-8AF2-9DCE7174E286@gmail.com>
References: <20191019141746.3d1551f1@windsurf.home>
 <4154F3C2-1876-461A-8AF2-9DCE7174E286@gmail.com>
Message-ID: <20191019152306.1749a465@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Oct 2019 10:01:52 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > If it is "up to v1.0.31", then the problem is fixed in uClibc-ng. Why
> > would we want to carry a work-around in libsseccomp ? To support older
> > uClibc-ng pre-built toolchains ?  
> 
> It?s not fixed in uClibc-ng, since there no version newer than 1.0.31.

There is a 1.0.32, which Buildroot uses since a few days, hence when
you said "up to 1.0.31", I thought it was fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
