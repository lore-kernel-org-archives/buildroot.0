From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 09:59:51 +0100
Subject: [Buildroot] [PATCH] ipset: bump to version 6.24
In-Reply-To: <1418253813-19934-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418253813-19934-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141211095951.2203bf67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 10 Dec 2014 20:23:33 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...Make_global.am-Don-t-include-host-headers.patch | 29 ----------------------
>  package/ipset/ipset.hash                           |  4 +--
>  package/ipset/ipset.mk                             |  3 ++-
>  3 files changed, 4 insertions(+), 32 deletions(-)
>  delete mode 100644 package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
