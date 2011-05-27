From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 27 May 2011 10:36:07 -0400
Subject: [Buildroot] ccache valgrind build errors / disabling ccache per
	package
Message-ID: <BANLkTikkDg9tiZZs5OdNHoD0jw7hUK4_BQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I'm working on updating the valgrind package based on a couple of
other patches floating around. However, I get the following error when
compiling:

/opt/buildroot/buildroot-git/output/host/usr/bin/ccache: invalid option -- t

Manually editing the Makefiles to remove ccache usage results in the
compile succeeding. Googling has not revealed an obvious solution to
this problem. Any advice?

As a side question, is there a flag for disabling ccache per package?

Thanks,
Mike
