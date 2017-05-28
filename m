From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:42:32 +0200
Subject: [Buildroot] [PATCH/next] package/fftw: bump version to 3.3.6-pl2
In-Reply-To: <20170528133151.6604-1-bernd.kuhls@t-online.de>
References: <20170528133151.6604-1-bernd.kuhls@t-online.de>
Message-ID: <20170528154232.012cf26b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 15:31:51 +0200, Bernd Kuhls wrote:
> Added sha256 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next.

> Platform options need major rework, please refer to
> http://patchwork.ozlabs.org/patch/661673/ for details.

Would indeed be nice to solve this problem at some point in the future.
The best would be if fftw build system was fixed to be able to generate
the different "versions" in one build pass rather than having to create
multiple Buildroot packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
