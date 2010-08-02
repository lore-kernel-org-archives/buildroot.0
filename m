From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Aug 2010 09:47:15 +0200
Subject: [Buildroot] [PATCH 2/2] Add target skeleton for Alix2d3
In-Reply-To: <4C45E761.2090702@gmail.com>
References: <20100712204654.17842.63829.stgit@darius-desktop>
	<20100712204834.17842.49951.stgit@darius-desktop>
	<20100713085323.56fa2157@surf> <4C45E761.2090702@gmail.com>
Message-ID: <20100802094715.787851fb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jul 2010 21:13:53 +0300
Darius Augulis <augulis.darius@gmail.com> wrote:

> at least there are grub configs. i will double check for other
> differences.

Ok, thanks. If it's just a grub configuration file, then we'll find a
way of keeping only these particular files, in order to avoid
duplicating the full target skeleton.

We already have multiple copies of target skeletons, and I'd like to
stop their proliferation :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
