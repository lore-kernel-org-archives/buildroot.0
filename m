From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:15:44 +0100
Subject: [Buildroot] [PATCH] socat: bump down to version 1.7.3.2
In-Reply-To: <d6ae63148fa0ada0848cb05f2d6b5d6fde70114f.1509287629.git.baruch@tkos.co.il>
References: <d6ae63148fa0ada0848cb05f2d6b5d6fde70114f.1509287629.git.baruch@tkos.co.il>
Message-ID: <20171029181544.679a0e1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 16:33:49 +0200, Baruch Siach wrote:
> Upstream socat2 branch seems to be dead. Last commit is from January
> 2016 . Over the last few years socat2 received only fixes cherry picked
> from the master 1.x branch. Most major general purpose distros only
> package socat 1.x.
> 
> Drop the threads dependency; not needed for 1.x.
> 
> Mention the OpenSSL exception in the license. Add hashes for license
> files.
> 
> Correct the autoconf comment. The tarball configure script is recent
> enough. But since we patch configure.in and Makefile.in we still need to
> autoconf.
> 
> All patches we carry for socat2 are also needed for socat 1.x.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/socat/Config.in  |  5 -----
>  package/socat/socat.hash |  8 ++++++--
>  package/socat/socat.mk   | 13 ++++++-------
>  3 files changed, 12 insertions(+), 14 deletions(-)

Applied to master, thanks. Are you using socat? If so, could you list
yourself in the DEVELOPERS file for this package?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
