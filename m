From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:55:37 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/vlc: add optional dependency
 to libupnp18
In-Reply-To: <20171217121845.16351-1-bernd.kuhls@t-online.de>
References: <20171217121845.16351-1-bernd.kuhls@t-online.de>
Message-ID: <20171218095537.2bc111ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 13:18:45 +0100, Bernd Kuhls wrote:
> Upstream added support for libupnp-1.8:
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commit;h=825dca78be3a81e2a1c5d04137aa01b1cb32dfd3
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: vlc can be used both with libupnp-1.6 and libupnp-1.8 (Thomas)
>     For build-testing http://patchwork.ozlabs.org/patch/849606/ was used

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
