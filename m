From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:00:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 21.2.1
In-Reply-To: <20210630152458.123355-1-bernd.kuhls@t-online.de>
References: <20210630152458.123355-1-bernd.kuhls@t-online.de>
Message-ID: <20210703230031.70ce2d0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Jun 2021 17:24:56 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added patch to remove hardening-related flags.
> 
> Updated license hash due to upstream commit
> https://github.com/intel/gmmlib/commit/9253eb8b949515d2a5030f99163a35567fe81838
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Drop-hardening-related-flags.patch   | 28 +++++++++++++++++++
>  package/intel-gmmlib/intel-gmmlib.hash        |  4 +--
>  package/intel-gmmlib/intel-gmmlib.mk          |  2 +-
>  3 files changed, 31 insertions(+), 3 deletions(-)
>  create mode 100644 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch

Series applied, thanks. It will be useful to watch for build failures
on these packages in the next days, I'm fearing that the removal of
X.org as a mandatory dependency might exhibit some new build failures.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
