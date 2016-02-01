From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 23:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-spidev: fix musl build
In-Reply-To: <1454249378-439-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454249378-439-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160201234504.28b8824f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 15:09:38 +0100, Bernd Kuhls wrote:
> The build error was not yet being found by the autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Fix-build-with-musl-libc.patch            | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/python-spidev/0001-Fix-build-with-musl-libc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
