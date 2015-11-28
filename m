From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 18:22:18 +0100
Subject: [Buildroot] [PATCH 1/2] infozip: rename to zip
In-Reply-To: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
References: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20151128182218.4f1ed922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Fri, 27 Nov 2015 18:38:00 +0100, Luca Ceresoli wrote:
> We currently have a package named "infozip" for Info-Zip's Zip.
> 
> With the upcoming addition of a package the Info-Zip's UnZip the name
> is becoming ambiguous. Rename it to the more specific name "zip".
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Jan Pedersen <jp@jp-embedded.com>
> ---
>  Config.in.legacy                                   | 12 ++++++++
>  package/Config.in                                  |  2 +-
>  ...emove-Check-C-compiler-type-optimization-.patch |  0
>  .../0002-configure-Don-t-use-host-CPP.patch        |  0
>  ...003-Makefile-Use-CFLAGS-from-command-line.patch |  0
>  ...4-configure-use-LDFLAGS-from-command-line.patch |  0
>  ...-unix-configure-remove-GID-UID-size-check.patch |  0
>  ...figure-borrow-the-LFS-test-from-autotools.patch |  0
>  package/{infozip => zip}/Config.in                 |  4 +--
>  package/{infozip/infozip.hash => zip/zip.hash}     |  0
>  package/{infozip/infozip.mk => zip/zip.mk}         | 32 +++++++++++-----------
>  11 files changed, 31 insertions(+), 19 deletions(-)
>  rename package/{infozip => zip}/0001-configure-Remove-Check-C-compiler-type-optimization-.patch (100%)
>  rename package/{infozip => zip}/0002-configure-Don-t-use-host-CPP.patch (100%)
>  rename package/{infozip => zip}/0003-Makefile-Use-CFLAGS-from-command-line.patch (100%)
>  rename package/{infozip => zip}/0004-configure-use-LDFLAGS-from-command-line.patch (100%)
>  rename package/{infozip => zip}/0005-unix-configure-remove-GID-UID-size-check.patch (100%)
>  rename package/{infozip => zip}/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch (100%)
>  rename package/{infozip => zip}/Config.in (88%)
>  rename package/{infozip/infozip.hash => zip/zip.hash} (100%)
>  rename package/{infozip/infozip.mk => zip/zip.mk} (66%)

Applied to next, thanks. Your second patch had some comments, so I will
wait for an updated version.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
