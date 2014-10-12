From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 18:52:25 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: explicitly set HAVE_SHARED
 depending on BR2_PREFER_STATIC_LIB
In-Reply-To: <1413131685-5567-3-git-send-email-abrodkin@synopsys.com>
References: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
 <1413131685-5567-3-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141012185225.40986f7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sun, 12 Oct 2014 18:34:45 +0200, Alexey Brodkin wrote:
> Now with change of BR2_PREFER_STATIC_LIB meaning to "do not build dynamic libs
> and build statically linked applications" it's possible to disable support of
> shared libs in uClibc as well as builting of shared libc libs.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/uclibc/uClibc-0.9.31.config   |  1 -
>  package/uclibc/uClibc-0.9.33.config   |  1 -
>  package/uclibc/uClibc-snapshot.config |  1 -
>  package/uclibc/uclibc.mk              | 11 +++++++++++
>  4 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
