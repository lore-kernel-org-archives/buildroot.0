From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:45:33 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2017.03-eng008
In-Reply-To: <1488545241-17332-1-git-send-email-vzakhar@synopsys.com>
References: <1488545241-17332-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170312234533.068a550e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 15:47:21 +0300, Vlad Zakharov wrote:
> This commit bumps ARC toolchain to arc-2017.03-eng008.
> 
> Please note that it is an engineering build and it might have all kinds
> of breakages, please don't use it for production builds.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  package/binutils/Config.in.host                                         | 2 +-
>  .../{arc-2016.09-release => arc-2017.03-eng008}/0300-ld-makefile.patch  | 0
>  .../0301-check-ldrunpath-length.patch                                   | 0
>  .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
>  .../0600-poison-system-directories.patch                                | 0
>  package/binutils/binutils.hash                                          | 2 +-
>  package/binutils/binutils.mk                                            | 2 +-
>  package/gcc/Config.in.host                                              | 2 +-
>  .../301-missing-execinfo_h.patch                                        | 0
>  .../{arc-2016.09-release => arc-2017.03-eng008}/860-cilk-wchar.patch    | 0
>  .../940-uclinux-enable-threads.patch                                    | 0
>  package/gcc/gcc.hash                                                    | 2 +-
>  package/gdb/Config.in.host                                              | 2 +-
>  package/gdb/gdb.hash                                                    | 2 +-
>  14 files changed, 7 insertions(+), 7 deletions(-)
>  rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0300-ld-makefile.patch (100%)
>  rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0301-check-ldrunpath-length.patch (100%)
>  rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
>  rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0600-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2016.09-release => arc-2017.03-eng008}/301-missing-execinfo_h.patch (100%)
>  rename package/gcc/{arc-2016.09-release => arc-2017.03-eng008}/860-cilk-wchar.patch (100%)
>  rename package/gcc/{arc-2016.09-release => arc-2017.03-eng008}/940-uclinux-enable-threads.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
