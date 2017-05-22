From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 16:12:17 +0200
Subject: [Buildroot] [PATCH/next] package/fio: bump version to 2.20,
 add hash
In-Reply-To: <20170521175724.24562-1-bernd.kuhls@t-online.de>
References: <20170521175724.24562-1-bernd.kuhls@t-online.de>
Message-ID: <20170522161217.0d35b377@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 19:57:24 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/fio/fio.hash | 2 ++
>  package/fio/fio.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/fio/fio.hash

Applied to next, thanks. I did an additional patch that re-enables fio
with external uClibc toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
