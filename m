From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:59:51 +0200
Subject: [Buildroot] [PATCH v4] package/linux-tools: add gpio
In-Reply-To: <20161004160114.4516-1-m.niestroj@grinn-global.com>
References: <20161004160114.4516-1-m.niestroj@grinn-global.com>
Message-ID: <20161005225951.5990e48f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Oct 2016 18:01:14 +0200, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v3 -> v4:
>  * Use LINUX_MAKE_FLAGS instead of directly specifying CROSS_COMPILE
>    (suggested by Yann)

Applied to master, thanks. Thanks also to Yann for the reviews!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
