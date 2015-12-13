From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:54:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/libxml2: Remove autoreconf
In-Reply-To: <1449359915-18919-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449359915-18919-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213225412.15120a19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  6 Dec 2015 00:58:34 +0100, Bernd Kuhls wrote:
> Autoreconf is not necessary since we do not patch this package anymore.
> 
> LIBXML2_AUTORECONF was added back in 2012
> https://git.busybox.net/buildroot/commit/package/libxml2?id=aa5d9ba3b86f21be934fdb436525a833bf120305
> 
> and apparently not removed along with the patches applied before
> https://git.busybox.net/buildroot/commit/package/libxml2?id=dc0e7cfc3e4050ce7c0404b11f747bf1500c50b7
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libxml2/libxml2.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
