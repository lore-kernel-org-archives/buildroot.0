From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:58:03 +0100
Subject: [Buildroot] [PATCH] lttng-libust: fix build on musl
In-Reply-To: <1488319770-6933-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488319770-6933-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305215803.32b9b53b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 23:09:30 +0100, Thomas Petazzoni wrote:
> This commit backports two upstream patches in lttng-libust, that fix
> the build with the musl C library.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/8bbcac9f9debf76cd1f56734bfd494677f2acd21/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...the-presence-of-dlmopen-at-configure-time.patch | 130 +++++++++++++++++++++
>  ...-include-config.h-to-resolve-HAVE_DLMOPEN.patch |  30 +++++
>  package/lttng-libust/lttng-libust.mk               |   1 +
>  3 files changed, 161 insertions(+)
>  create mode 100644 package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
>  create mode 100644 package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
