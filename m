From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:23:17 +0200
Subject: [Buildroot] [PATCH] sane-backends: bump to version 1.0.24
In-Reply-To: <1430487647-9710-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430487647-9710-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150501162317.1991ba80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  1 May 2015 10:40:47 -0300, Gustavo Zacarias wrote:
> Bump sane-backends to a "modern" 1.0.24 version.
> Tweak the patches to avoid autoreconf (it doesn't seem to be happy for
> me in gentoo).
> Disable cups support (checks are wrong and it's no longer required).
> Disable systemd support (checks are wrong and we never accounted for
> this).
> 
> Should fix wine failure (i was unable to build sane-backends before):
> http://autobuild.buildroot.net/results/d01/d01a3c7786df8cfd962a27f39283851db45c6165/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0002-remove-unsafe-headers-path.patch          | 24 ++++++++
>  package/sane-backends/0002-v4l.patch               | 66 ----------------------
>  .../0003-remove-cups-and-systemd-support.patch     | 56 ++++++++++++++++++
>  .../0003-remove-unsafe-headers-path.patch          | 28 ---------
>  package/sane-backends/sane-backends.hash           |  2 +
>  package/sane-backends/sane-backends.mk             |  6 +-
>  6 files changed, 84 insertions(+), 98 deletions(-)
>  create mode 100644 package/sane-backends/0002-remove-unsafe-headers-path.patch
>  delete mode 100644 package/sane-backends/0002-v4l.patch
>  create mode 100644 package/sane-backends/0003-remove-cups-and-systemd-support.patch
>  delete mode 100644 package/sane-backends/0003-remove-unsafe-headers-path.patch
>  create mode 100644 package/sane-backends/sane-backends.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
