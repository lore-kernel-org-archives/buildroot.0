From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 14:41:54 +0200
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <945373162.2243254.1435567764904.JavaMail.root@openwide.fr>
References: <20150628161433.3b075437@free-electrons.com>
 <945373162.2243254.1435567764904.JavaMail.root@openwide.fr>
Message-ID: <20150629144154.4616ef60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Denis,

On Mon, 29 Jun 2015 10:49:24 +0200 (CEST), Denis Thulin wrote:

> > So it only works with Python 2. What about using
> > https://pypi.python.org/pypi/robotframework-python3 instead, which
> > seems to support both Python 2 and Python 3 ? Or maybe this is not an
> > "official" version ?
> 
> According to the Robot Framework install instructions, the Python 3 port is an
> unofficial one.
> see: https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#introduction
> 
> It is also not up to date as the python 3 port is 3 versions late.

Ok. Can you indicate this maybe in the Config.in help text?

> I could make a different package for it though.

No, no need to do it if you don't have the need for it.

> > I'll mark your patch as Changes Requested in patchwork. Can you
> > resend
> > an updated version that takes into account the comments from Arnout?
> 
> I'm working on it, but as it is my test package for scanpypi, I might not submit
> it before the end of the week.

No problem.

Thanks a lot for working on this scanpypi script!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
