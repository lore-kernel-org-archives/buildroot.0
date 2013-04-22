From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 17:46:12 +0200
Subject: [Buildroot] [PATCH 0/7] RFC: ARC port
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130422174612.0e7b97fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 22 Apr 2013 13:37:24 +0200, Mischa Jonker wrote:

> In the following patch series I've added ARC support to the "master" tree
> of BuildRoot. As ARC support is not yet in all upstream open source packages,
> I've taken the freedom to add an option for an additional download site, from
> which ARC-specific versions of gcc, binutils, etc. can be downloaded.
> 
> ARC will be in Linux 3.9, so that would be the first package that can be
> removed from this ARC-specific download site.
> 
> The below patchset builds the toolchain, and a working root file system. Most
> simple packages build OK, but mplayer for instance does not have ARC support,
> and there are probably others as well.
> 
> Could you please have a look at the patches and let me know what to do to
> make them BuildRoot-worthy?

Thanks for sending out all those patches! I'm going to reply to them
individually for comments.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
