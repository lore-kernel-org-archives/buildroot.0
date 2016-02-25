From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:46:29 +0100
Subject: [Buildroot] [PATCH 1/4] package/iputils: removed dependency on
 openssl
In-Reply-To: <1456406615-7324-1-git-send-email-martin@barkynet.com>
References: <1456406615-7324-1-git-send-email-martin@barkynet.com>
Message-ID: <20160225214629.1cdab9f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Thu, 25 Feb 2016 13:23:32 +0000, Martin Bark wrote:
> iputils does not have to be built with openssl so remove selecting
> BR2_PACKAGE_OPENSSL and make the dependency optional
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/iputils/Config.in  | 1 -
>  package/iputils/iputils.mk | 8 +++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)

All four patches applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
