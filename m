From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 20:56:46 +0200
Subject: [Buildroot] [PATCH 11/35] pkg-generic: implement
 <pkg>-all-{source, legal-info, external-deps} targets
In-Reply-To: <20150330174512.GD4318@free.fr>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150329214739.GL4093@free.fr> <20150330174512.GD4318@free.fr>
Message-ID: <20150330205646.7f919e51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 30 Mar 2015 19:45:12 +0200, Yann E. MORIN wrote:

> Actually, I may have to withdraw that reviewed tag of mine...
> 
> Testing patch 20/35 (Makefile: use <pkg>-all-legal-info to implement the
> legal-info target) does not give the same result as previously:
> 
>   - some packages that are not enabled get their legal-info "installed"
>   - some non-existing or disabled host packages have their legal-info
>     isntalled as well...
> 
> Not sure this is due to theis patch 11/35, or really due to 20/35 (even
> though I have some clues as to incriminate patch 11...).
> 
> I'll be investigating this a bit later...

Can you give some specific example, i.e a defconfig that exhibits the
problem?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
