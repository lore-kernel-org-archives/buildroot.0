From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 21:54:16 +0100
Subject: [Buildroot] [PATCH 0/7] gcc5 fixes for defconfigs
In-Reply-To: <20170228212355.36a91c98@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 28 Feb 2017 21:23:55 +0100")
References: <20170228174001.23830-1-arnout@mind.be>
 <20170228212355.36a91c98@free-electrons.com>
Message-ID: <87a896hw93.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > However, it has already been noticed a while ago that these defconfigs
 > were broken, I did a build test of all defconfigs some time ago, and
 > reported the issue to the developers who contributed the defconfig
 > originally. Peter also helped in this effort. See e-mails like:

 >    [Buildroot] Altera socdk defconfig no longer builds
 >    [Buildroot] Altera sockit defconfig no longer builds
 >    [Buildroot] via_imx6_vab820_defconfig fails to build
 >    etc.

 > For all the boards you are fixing now, Peter or me contacted the
 > original submitters. If they haven't been fixed by now, then I would
 > instead suggest to simply drop support for those boards.

I agree. Especially as we don't have access to (most) of the boards, and
older bootloaders/kernels sometimes do break at runtime with newer gcc
versions.

E.G. if the defconfigs aren't really supported and looked after, then we
should pretend they are.

-- 
Bye, Peter Korsgaard
