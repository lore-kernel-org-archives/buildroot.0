From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 07 Jul 2011 12:25:59 +0200
Subject: [Buildroot] [pull request v3] Pull request for
	branch	for-2011.08/bootloaders
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4E1589B7.1090502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> We have a package infrastructure that allows to share a lot of common
> behaviour between packages, and allows to add new features easily to
> all existing packages (Git/Mercurial download support, or usage of an
> external source tree, etc.).
>
> Unfortunately, some of the packages that would most benefit from those
> new infrastructure features are the bootloader and kernel, since it's
> typically the software components that have to be modified/tuned
> during the course of an embedded Linux project.
>
> Therefore, this series converts all bootloaders makefiles and the
> kernel makefile to the package infrastructure, and adds the
> possibility of fetching the kernel and u-boot through Git (it can be
> added to other bootloaders with just a few lines of changes, mostly at
> the Config.in level).
...

I've commented (on the v2 thread) about patch 03:
http://lists.busybox.net/pipermail/buildroot/2011-July/043980.html

I'd like that patch to at least return how it was in v2.

For all patches except patch 3:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

[after reading Documentation/SubmittingPatches a few times, I have come
to the conclusion that none of Reviewed-by: and Tested-by: imply the
other one, but they somehow imply Acked-by:... :) ]

Luca
