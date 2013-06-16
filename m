From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jun 2013 20:05:40 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130616172508.GL3495@free.fr>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
Message-ID: <20130616200540.5a370504@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Jun 2013 19:25:08 +0200, Yann E. MORIN wrote:

> > Indeed. Are we also talking about a daily e-mail?
> 
> If there are build failures, yes.
> Of course, no need for a mail if no build failure.

Ok. This will require a little bit of work, because until now, the
autobuild.buildroot.org machine, which sends the daily e-mails, was not
using the Buildroot source code at all to do its job. So either the
slave build machines will have to submit the list of maintainers of the
failing package as part of the tarball they submit to
autobuild.buildroot.org, or autobuild.b.o will have to look at the
Buildroot source code to find the maintainers of the failing package.

Either way, it will not be immediate to implement.

> Yes, that's my preferred one.
> 
> Should that be a single email adress, or can this be a list?
>     FOO_MAINTAINERS = me at there him at overthere somone at somewhere

A list of e-mails, definitely.

> I'll adapt the manual to document this new variable, and will submit a
> patch to add myself as maintainer for a few packages.

Ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
