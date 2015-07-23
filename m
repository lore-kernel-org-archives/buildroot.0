From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:14:53 +0200
Subject: [Buildroot] [PATCH] package/gcc: fix typo for CFLAGS_FOR_TARGET
In-Reply-To: <1437685735-7281-1-git-send-email-romain.naour@openwide.fr>
References: <1437685735-7281-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150723231453.0048af46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 23 Jul 2015 23:08:55 +0200, Romain Naour wrote:
> CFLAGS_FOR_TARGET is initialized with GCC_COMMON_TARGET_CXXFLAGS.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/gcc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
