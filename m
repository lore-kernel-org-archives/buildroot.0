From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:56:09 +0200
Subject: [Buildroot] [PATCH 01/11] package/ulogd: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150720225609.6644867c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 20 Jul 2015 19:47:49 +0200, Romain Naour wrote:
> Autoreconf is not needed anymore since ulogd 2.0.4
> where logd-01-pthread-conditional.patch was removed.
> 
> commit: 010745a955b6cf4c979588fafdb7506460038e0f
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/ulogd/ulogd.mk | 1 -
>  1 file changed, 1 deletion(-)

All 11 patches applied, thanks. I have not tested them, I trust you :)
The autobuilders will tell me if I was right or not! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
