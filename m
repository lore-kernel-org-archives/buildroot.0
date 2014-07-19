From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:40:59 +0200
Subject: [Buildroot] [PATCH] libuv: new package
In-Reply-To: <1405715058-4629-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405715058-4629-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140719114059.3cc31466@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 18 Jul 2014 17:24:18 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in       |  1 +
>  package/libuv/Config.in | 14 ++++++++++++++
>  package/libuv/libuv.mk  | 22 ++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 package/libuv/Config.in
>  create mode 100644 package/libuv/libuv.mk

Thanks, applied, after taking into account Yann's suggestion.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
