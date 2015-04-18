From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:36:50 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc: unbreak SH & SPARC
In-Reply-To: <1429217745-3205-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429217745-3205-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150418153650.59685220@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 Apr 2015 17:55:44 -0300, Gustavo Zacarias wrote:
> The patch from commit 200aad4f3206c9f151f15922dd02b01f474a5503 broke sh
> and sparc builds.
> Add and adjust a patch from uClibc master that fixes this.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 package/uclibc/0.9.33.2/0070-libm-honor-NO_LONG_DOUBLE-in-ldouble_wrappers.patch

Applied, thanks.

Waldemar, is this patch also needed for uClibc-ng ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
