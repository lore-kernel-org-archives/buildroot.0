From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:44:40 +0200
Subject: [Buildroot] [PATCH 1/1] gcc/libmudflap: unavailable for gcc >=
 4.9
In-Reply-To: <1465058756-9612-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465058756-9612-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160607234440.678e2e68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 18:45:56 +0200, Bernd Kuhls wrote:
> Rework gcc dependency for mudflap as suggested by Arnout and Peter:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149813
> 
> libmudflap was removed in gcc 4.9:
> https://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gcc/Config.in.host | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks. We will be able to remove mudflap support
when gcc 4.8 gets deprecated.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
