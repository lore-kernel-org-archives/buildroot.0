From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 29 Apr 2016 15:24:09 -0300 (BRT)
Subject: [Buildroot] 2016.05-rc1 approaching: what to merge?
In-Reply-To: <20160428160000.5db9d1cb@free-electrons.com>
References: <20160428160000.5db9d1cb@free-electrons.com>
Message-ID: <997724720.12615780.1461954249276.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: buildroot at uclibc.org
> Sent: Thursday, April 28, 2016 11:00:00 AM
> Subject: [Buildroot] 2016.05-rc1 approaching: what to merge?

> Hello,
> 
> We're approaching the end of April, and therefore the beginning of May,
> which means that 2016.05-rc1 will be released soon, most likely in
> about a week.
> 
> As a reminder, once -rc1 is released, we don't merge new packages or
> version bumps, but only build fixes, security fixes, documentation
> updates, etc. Of course, anything that doesn't get merged before -rc1
> can be merged for the next release, 2016.08.
> 
> So the question is: we have ~230 patches pending patchwork. Do you see
> anything that we should really merge before 2016.05-rc1 is released?

I would like to have the fix for GTest/GMock applied before I start working on a new "googletest" package that would replace them:

    http://patchwork.ozlabs.org/patch/586130/

Carlos Santos (Casantos)
DATACOM, P&D
