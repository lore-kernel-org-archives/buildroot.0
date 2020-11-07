From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:44:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: bump to version 6.13.3
In-Reply-To: <20201105195905.986731-1-fontaine.fabrice@gmail.com>
References: <20201105195905.986731-1-fontaine.fabrice@gmail.com>
Message-ID: <20201107134451.23ab317f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Nov 2020 20:59:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Refresh first patch
> - Replace second patch (this new iteration of previous patch has not
>   been merged and does not apply cleanly on current version)
> - Update hash of README.md (CircleCI gadget added with
>   https://github.com/facebook/rocksdb/commit/63b59f21d9971fc941e3ee2244783a3c16bd5ad4)
> - LTO is supported since version 6.12.6 and
>   https://github.com/facebook/rocksdb/commit/c0c33a4854587e412742841f199edd4616be6c00
> - DESTDIR and PREFIX are supported since version 6.13.2 and
>   https://github.com/facebook/rocksdb/commit/1e59800718b29d4a762b8ac356767a701f968a4d
> 
> https://github.com/facebook/rocksdb/releases/tag/v6.13.3
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a9798bb279a668a266c472fb026b68dbccf50431
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ls-build_detect_platform-fix-C-tests.patch |   67 +-
>  ...patiblity-fix-CRC32-C-implementation.patch | 3787 +++++++++++++++
>  ...e-POWER-crc32c-with-C-implementation.patch | 4058 -----------------
>  package/rocksdb/rocksdb.hash                  |    4 +-
>  package/rocksdb/rocksdb.mk                    |   16 +-
>  5 files changed, 3857 insertions(+), 4075 deletions(-)
>  create mode 100644 package/rocksdb/0002-POWER7-8-compatiblity-fix-CRC32-C-implementation.patch
>  delete mode 100644 package/rocksdb/0002-replace-POWER-crc32c-with-C-implementation.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
