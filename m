From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:57:16 +0100
Subject: [Buildroot] [PATCH buildroot-test v2] scripts/autobuild-run:
 create host-distro file
In-Reply-To: <20200914204101.16172-1-heiko.thiery@gmail.com>
References: <20200914204101.16172-1-heiko.thiery@gmail.com>
Message-ID: <20201025155716.0ddfe0ad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 22:41:02 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Sometimes autobuilder failures occur only on a specific distribution. To
> ease the research for the maintainer/developers add the host distribution
> information to the result archive.
> 
> The distribution information comes from '/etc/os-release' (or
> '/usr/lib/os-release') that seems to be present on the most common distros:
> 
> Debian: https://manpages.debian.org/buster/systemd/os-release.5.en.html
> Ubuntu: http://manpages.ubuntu.com/manpages/bionic/man5/os-release.5.html
> Red Red: https://www.freedesktop.org/software/systemd/man/os-release.html
> Open-Suse: https://en.opensuse.org/SDB:Find_openSUSE_version
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v2:
>  - implement comments from Yann
>  - copy the whole file (os-release) as host-distro to the result archive
>  - reword the commit log

Applied to buildroot-test. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
