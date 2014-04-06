From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:10:40 +0200
Subject: [Buildroot] [PATCH 1/2] util-linux: unshare: include libmount.h
 to provide missing MS_* defines
In-Reply-To: <1396776553-7064-1-git-send-email-romain.naour@openwide.fr>
References: <1396776553-7064-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140406141040.5a05b8e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  6 Apr 2014 11:29:12 +0200, Romain Naour wrote:
> upstream patch: d754315c54af9cb8222e0a04ed5b2b4b927ed176
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...util-linux-003-unshare-include-libmount.h.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/util-linux/util-linux-003-unshare-include-libmount.h.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
