From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jun 2010 15:49:34 +0200
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
 configuredownload site
In-Reply-To: <20100604103232.3f415c39@surf>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
	<002101cb0223$38af8910$aa0e9b30$@pauljones.id.au>
	<20100604103232.3f415c39@surf>
Message-ID: <20100605154934.6ebd9068@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 4 Jun 2010 10:32:32 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Thanks for the feedback. I'll add something that allows to download
> arbitrary tarballs. That's something that I also did for my Linux
> kernel code cleanup in Buildroot, so I'll reuse the same scheme. I'll
> post an updated version of this patch probably during this WE.

Here my proposal to improve U-Boot support to take into account the
issue you reported:

http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=bootloaders-cleanup&id=13ef908685caecd17ba67953fd1fee8a559231a2

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
