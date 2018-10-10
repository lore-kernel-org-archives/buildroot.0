From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:25:23 +0200
Subject: [Buildroot] [PATCH 12/13] pkg-perl: add a target which upgrades
 all packages from metacpan
In-Reply-To: <CAB0FRsu56_UpK0EHAhVrMr5Z1Pc=Oeqr9YhU+vMHQog_bc2wtA@mail.gmail.com>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
 <20181010064621.19253-13-francois.perrad@gadz.org>
 <20181010091049.241adca4@windsurf>
 <CAB0FRsu56_UpK0EHAhVrMr5Z1Pc=Oeqr9YhU+vMHQog_bc2wtA@mail.gmail.com>
Message-ID: <20181010102523.1eecb42d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 09:33:49 +0200, Fran?ois Perrad wrote:

> > I'm curious to understand why you're adding only target Perl packages.
> >  
> 
>  `scancpan` fetch recursively all dependencies of a package.

OK, thanks for the explanation.

In the Python case, we have a few Python host packages that are listed
in package/Config.in.host, i.e they may exist or be built, without
being a dependency of a target Python package. But that's not the case
with Perl today, so OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
