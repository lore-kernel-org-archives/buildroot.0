From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Aug 2010 22:50:32 +0200
Subject: [Buildroot] [PATCH 0/2] Add support for Alix2d3 board from PC
	Engines
In-Reply-To: <4C5C5EB1.4020500@gmail.com>
References: <20100712204654.17842.63829.stgit@darius-desktop>
	<4C5C5EB1.4020500@gmail.com>
Message-ID: <20100806225032.669dfa12@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 06 Aug 2010 22:12:49 +0300
Darius Augulis <augulis.darius@gmail.com> wrote:

> Did anybody review it? Maybe it's ready to merge it to main line?

As 2010.08-rc1 has been released, only bug fixes will be merged until
the release of 2010.08.

My top-priority item for 2010.11 is to cleanup the board support in
Buildroot (I already have a stack of patches started on this topic). As
part of this effort, I intend to merge all pending contributions that
add board support.

However, I don't consider this one as ready, as it adds a new complete
target skeleton for just a new Grub configuration, as discussed a week
ago on the list. We need to find a different solution to this than
duplicating the target skeleton.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
