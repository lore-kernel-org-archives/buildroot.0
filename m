From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 17:03:32 +0200
Subject: [Buildroot] [PATCH] package/efl: disable libevas jp2k loader
In-Reply-To: <1467928869-2412-1-git-send-email-romain.naour@gmail.com>
References: <1467928869-2412-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160715170332.68fe212c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jul 2016 00:01:09 +0200, Romain Naour wrote:
> When the support for JP2K is requested, the configure script is looking
> for libopenjpeg1.pc which is not provided by the openjpeg package since
> it's too recent (currently v2.1).
> 
> Mark BR2_PACKAGE_EFL_JP2K as broken until a new version of the efl
> stack support the new openjpeg library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ff1/ff1dbbc6cffdb5b2550b3613295151ff9fa964d6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
