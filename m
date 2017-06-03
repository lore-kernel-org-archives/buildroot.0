From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 17:07:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext: needs autoreconf after
 'update wint_t.m4 from gnulib' commit
In-Reply-To: <20170603131818.12872-1-bernd.kuhls@t-online.de>
References: <20170603131818.12872-1-bernd.kuhls@t-online.de>
Message-ID: <20170603170755.5c9864b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 15:18:18 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/ae7/ae743aaf5933c2e4a0bf3ca75aa93c16540422f8/
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gettext/gettext.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
