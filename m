From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:23:56 +0200
Subject: [Buildroot] [PATCHv4 00/18] Package based 'source', 'legal-info',
 'source-check' and 'external-deps'
In-Reply-To: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150426222356.4bfdb360@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sun, 26 Apr 2015 11:50:58 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (18):
>   fs: only add non rootfs- targets to PACKAGES
>   pkg-generic: take into account patch dependencies in source,
>     external-deps and legal-info
>   Makefile: use the package infra based external-deps
>   pkg-download: remove support for the SHOW_EXTERNAL_DEPS DL_MODE
>   Makefile: move source-check outside of noconfig_targets
>   pkg-download: extend DOWNLOAD_INNER, add a SOURCE_CHECK macro
>   pkg-generic: implement source-check targets
>   Makefile: implement a package based source-check target
>   pkg-generic: remove the .stamp_rsync_sourced fake stamp file
>   pkg-generic: don't use DL_MODE in .stamp_downloaded
>   pkg-download: get rid of DL_MODE
>   pkg-download: fix indentation for SOURCE_CHECK_* macros
>   pkg-generic: introduce a <pkg>_ALL_DOWNLOADS variable and factorize
>     code
>   Makefile: implement the 'source' target using the package
>     infrastructure
>   Makefile: remove unneeded variables
>   Makefile: add BR_BUILDING variable
>   packages: refactor checks using BR_BUILDING
>   Makefile: add a few more targets to nobuild_targets

This patch series is now fully applied. Thanks a lot to Yann and Arnout
for helping with their in-depth review and testing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
