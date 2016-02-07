From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:01:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/openipmi: fix musl build
In-Reply-To: <1454232190-11626-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454232190-11626-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207150153.6d228cd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 10:23:10 +0100, Bernd Kuhls wrote:
> The build error is known upstream
> http://sourceforge.net/p/openipmi/patches/26/
> and was not yet caught by our autobuilders:
> 
> ui.c: In function ?get_ip_addr?:
> ui.c:340:5: error: unknown type name ?u_int32_t?
>      u_int32_t     addr;
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openipmi/openipmi.hash | 2 ++
>  package/openipmi/openipmi.mk   | 2 ++
>  2 files changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
