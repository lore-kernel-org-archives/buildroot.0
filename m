From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 14:44:21 +0100
Subject: [Buildroot] [PATCH next v5 4/9] Makefile: move .NOTPARALLEL
 statement after including .config file
In-Reply-To: <20181120201810.GG2601@scaer>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-5-thomas.petazzoni@bootlin.com>
 <20181120201810.GG2601@scaer>
Message-ID: <20181121144421.0032db96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 21:18:10 +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-11-20 17:35 +0100, Thomas Petazzoni spake thusly:
> > In a follow-up commit, we will make the .NOTPARALLEL statement
> > conditional on a Config.in option, so we need to move it further down.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> You forgot to carry my:
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Ah right, I'll add it for v6.

> (Granted, it was hiding below a long rant/research about the need of a
> config option ;-] )

And I will update the commit log to include some explanation as to why
we need an explicit option and not enable per-package folders
automagically when make -jN is passed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
