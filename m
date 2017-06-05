From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:52:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exiv2: fix gettext detection, part II
In-Reply-To: <20170604084317.29214-1-bernd.kuhls@t-online.de>
References: <20170604084317.29214-1-bernd.kuhls@t-online.de>
Message-ID: <20170605115242.4e095349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 10:43:17 +0200, Bernd Kuhls wrote:
> It seems getting the gettext stuff right on all platforms is not that
> easy, this patch bumps exiv2 to include all gettext (and pthreads)
> patches applied upstream.
> 
> To reproduce the problem gettext has to be built before exiv2 so we
> make gettext an optional dependency when NLS support is used.
> 
> Fixes
> http://autobuild.buildroot.net/results/a56/a56c8a8a4c76b7c359ca7f5252be93fd70c6a4c1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: bumped to latest git head

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
