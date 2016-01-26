From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:09:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/aumix: bump version to 2.9.1
In-Reply-To: <1453842198-1428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453842198-1428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126220936.19114772@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 26 Jan 2016 22:03:18 +0100, Bernd Kuhls wrote:
> - rebased patch 0001
> - added AUMIX_GETTEXTIZE = YES to solve
>   *** error: gettext infrastructure mismatch: using a Makefile.in.in
>   from gettext version 0.17 but the autoconf macros are from gettext
>   version 0.19
> 
> Fixes
> http://autobuild.buildroot.net/results/c8c/c8c7f9a799d1af507a6edd5e02b0bbc8b7b5d068/
> http://autobuild.buildroot.net/results/67e/67e6d29e6d6f8d4967a74ec70a754a5b24afc0ce/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/aumix/0001-fix-incorrect-makefile-am.patch | 9 ++++-----
>  package/aumix/aumix.hash                           | 4 ++--
>  package/aumix/aumix.mk                             | 3 ++-
>  3 files changed, 8 insertions(+), 8 deletions(-)

Applied, thanks. I was going to say "please submit patch 0001
upstream", but upstream is dead since 2010...

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
