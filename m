From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 15:10:35 +0100
Subject: [Buildroot] [PATCH 2/2] enable static linking for libfuse
In-Reply-To: <2a2dadee-301e-6840-0f78-680d09211649@petroprogram.com>
References: <20171214105706.4577-1-aep@exys.org>
 <20171214105706.4577-2-aep@exys.org>
 <20171214162102.25c6d252@windsurf>
 <CABukmmN-WtUiGpUGTWUhPhkFLOaLAgMNfXujMwMUkNB=P8PHQA@mail.gmail.com>
 <20171214165210.40b8f73d@windsurf>
 <2a2dadee-301e-6840-0f78-680d09211649@petroprogram.com>
Message-ID: <20171215151035.1f0f7925@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Dec 2017 15:12:41 +0200, Stefan Fr?berg wrote:

> > I guess musl always has dlopen(), even in a purely statically linked
> > scenario, while uClibc does not have it.
> >
> > Thomas  
> 
> But doesn't static glibc also use dlopen() ?

We don't support glibc with BR2_STATIC_LIBS=y.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
