From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:16:53 +0100
Subject: [Buildroot] [PATCH 3/6] php-zmq: new package
In-Reply-To: <52E82B2B.5040705@zacarias.com.ar>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
 <1390944391-3892-3-git-send-email-gustavo@zacarias.com.ar>
 <20140128230558.157ee3eb@skate> <52E82B2B.5040705@zacarias.com.ar>
Message-ID: <20140128231653.503d0114@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Jan 2014 19:11:55 -0300, Gustavo Zacarias wrote:

> > Just curious, how many potential PHP packages could we add? The build
> > logic for the four packages you submitted looks highly similar, maybe
> > it calls a php-package infrastructure?
> > 
> > The only "difficulty" is that it would have to inherit from
> > autotools-package, which itself already inherits from generic-package.
> > So it would be the first package infrastructure to inherit from a
> > package infra that already inherits from generic-package. I'm sure it
> > can work, but it might raise issues with some missing quoting.
> 
> Not that many that are useful, many are abandonware, that being the
> reason i opted for the autotools infra with the tweak.
> PECL packages are compiled (these ones are), PEAR packages are normally
> interpreted so it's just a matter of just installing them.
> Arguably we could also enable PEAR installs in the target itself but i
> don't think it's the spirit of buildroot, like CPAN for perl.
> But we don't have any PEAR packages at the moment.

Ok. Then I guess we should go ahead with what you proposed, and only
introduce a PHP package infra if we get over 10 PHP packages or so.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
