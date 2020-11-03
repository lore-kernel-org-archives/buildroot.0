From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:00:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: bump version to 2.45
In-Reply-To: <20201103072249.24058-1-heiko.thiery@gmail.com>
References: <20201103072249.24058-1-heiko.thiery@gmail.com>
Message-ID: <20201103220043.6016b09e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Nov 2020 08:22:49 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This libcap release is now able to build on environments w/o thread support.
> 
> - add PTHREADS make arg to allow building without thread support
> - add SHARED make arg (replace of DYNAMIC)
> - remove patch that function is now in upstream (SHARED)
> 
> Fixes:
> http://autobuild.buildroot.net/results/fc1e7573327c7412dfa45b45a96966d993c7fc86/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> CC: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...disable-building-installing-shared-l.patch | 38 -------------------
>  package/libcap/libcap.hash                    |  2 +-
>  package/libcap/libcap.mk                      |  5 ++-
>  3 files changed, 4 insertions(+), 41 deletions(-)
>  delete mode 100644 package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch

Thanks a lot for working with upstream on resolving the build issues!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
