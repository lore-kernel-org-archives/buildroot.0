From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 14:29:32 +0100
Subject: [Buildroot] [PATCH] package/openjpeg: fix static build
In-Reply-To: <20161106163559.4788-1-s.martin49@gmail.com>
References: <20161106163559.4788-1-s.martin49@gmail.com>
Message-ID: <20161113142932.15adcad5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 17:35:59 +0100, Samuel Martin wrote:
> This change adds a patch to openjpeg fixing the tiff indirect
> dependencies in case of static build.
> 
> A similar patch for upstream master has been submitted [1].
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d0d/d0d22727311d6300e0e400728126170407bfd699/
>   and many others...
> 
> [1] https://github.com/uclouvain/openjpeg/pull/866
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  ...tiff-append-flags-found-by-pkg-config-if-.patch | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
