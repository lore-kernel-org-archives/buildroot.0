From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 10:40:37 +0100
Subject: [Buildroot] [PATCH] fio: new package
In-Reply-To: <20131225203252.GB7812@localhost>
References: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131225173455.0c413356@skate> <20131225201731.GA7812@localhost>
 <20131225212829.603981b9@skate> <20131225203252.GB7812@localhost>
Message-ID: <20131226104037.6cb81f36@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 25 Dec 2013 17:32:53 -0300, Ezequiel Garcia wrote:

> > But older uClibc toolchains do not work, and are causing build
> > failures such as
> > http://autobuild.buildroot.org/results/f7a/f7ae7ac2b5da9afc6314f1e813300597896e5ca6/build-end.log.
> > 
> > I believe the best solution for now is to mark this package as not
> > available for uClibc toolchains.
> > 
> 
> Right. And in parallel, we can also take care of upstreaming a patch
> which uses HAVE_POSIX_MADVISE to handle such case.

The problem is what should we use in replacement of posix_madvise()
when it is not available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
