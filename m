From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Fri, 8 May 2009 10:22:26 +0200
Subject: [Buildroot] [PATCH] .gitignore: Add download directory 'dl'
In-Reply-To: <200905080144.11199.markus.heidelberg@web.de>
References: <1241649940-16168-1-git-send-email-mroth@nessie.de>
	<200905070544.51649.markus.heidelberg@web.de>
	<4A02D23C.309@nessie.de>
	<200905080144.11199.markus.heidelberg@web.de>
Message-ID: <20090508102226.6a8eaa97@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 8 May 2009 01:44:10 +0200
Markus Heidelberg <markus.heidelberg@web.de> wrote:

> Michael Roth, 07.05.2009:
> > Markus Heidelberg schrieb:
> > 
> > > What about additionally adding /.config* ?
> > > I guess it's quite common to have some configs laying around.
> > 
> > Hmm, yes, but maybe different people use different names:
> > For example I'm using config.foobar and you're maybe using
> > .config.foobar and others maybe using foobar.config etc.
> 
> The Linux Kernel has .* as global ignore rule, which makes .config*
> files ignored. Sticking to the already existing .config as prefix for
> other configs makes it faster to rename/copy the .config because of the
> filename completion.
> 
> > So I don't think, there exists a global rule for custom .config
> > file names.
> 
> Not officially, but maybe as common convention.
> 
> If you don't want to add it, it's OK. I will then submit a patch myself,
> since I think this is just the most common way to keep backup config
> files around.
I've added my "personal" configs to .git/info/exclude.
Has the same syntax as .gitignore, but it is not commit to the 
repsitory by accident :)

Regards
Olaf
