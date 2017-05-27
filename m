From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:17:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/popt: fix libiconv dependency
In-Reply-To: <20170527081952.24584-1-bernd.kuhls@t-online.de>
References: <20170527081952.24584-1-bernd.kuhls@t-online.de>
Message-ID: <20170527171757.78444693@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 10:19:52 +0200, Bernd Kuhls wrote:
> Make sure that libiconv is built before popt when needed.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/popt/popt.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
