From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jan 2018 21:43:40 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
Message-ID: <20180105214340.6f0cc1f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just a quick note to let you know that from here, patchwork.ozlabs.org
seems to be down at this time (or awfully slow).

Also, since a few weeks, we have seen that patchwork misses some
patches that are sent on the Buildroot mailing list. The mails are sent
on the mailing list, they are in the mailing list archives, but
patchwork does not record them.

An example is:

  http://lists.busybox.net/pipermail/buildroot/2017-December/209885.html

PATCH 3/3 was not recorded by patchwork, while other patches in the
series have been.

This again happened today. The first send of:

  http://lists.busybox.net/pipermail/buildroot/2018-January/210797.html

only had a few of its patches recorded by patchwork. It was resent a
few minutes later:

  http://lists.busybox.net/pipermail/buildroot/2018-January/210858.html

and then all the patches got recorded.

This is quite annoying. Is there a way to look in the patchwork logs
what has happened with those patches ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
