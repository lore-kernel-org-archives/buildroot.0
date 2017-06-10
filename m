From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:07:56 +0200
Subject: [Buildroot] [PATCH 1/4] package/beecrypt: needs host gcc >= 4.8
 for icu support
In-Reply-To: <20170610091501.28983-1-bernd.kuhls@t-online.de>
References: <20170610091501.28983-1-bernd.kuhls@t-online.de>
Message-ID: <20170610230756.2fb22ed0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 11:15:01 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/beecrypt/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Series applied, thanks. However, it is worth mentioning that the series
doesn't appear properly threaded. Did you use git send-email to send
the whole series at once?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
