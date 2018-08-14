From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:41:27 +0200
Subject: [Buildroot] [PATCH/next v3 1/1] package/qt5/qt5base: fix statx
 support with glibc >= 2.28
In-Reply-To: <20180813194206.24355-1-bernd.kuhls@t-online.de>
References: <20180813194206.24355-1-bernd.kuhls@t-online.de>
Message-ID: <20180814154127.1a60cab7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 21:42:06 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: switched to upstream patch (Thomas)
> v2: git-formatted patch (Thomas)
>     re-sent because it did not appear on patchworks

Applied to next, thanks. Did you check if this issue also applies to Qt
5.6.3, which we still support ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
