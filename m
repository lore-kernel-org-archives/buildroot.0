From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 15 Nov 2019 10:29:22 +0300
Subject: [Buildroot] [PATCH 1/1] add pattern based copy for ATF as
 already used for u-boot. This add support for different platforms where the
 binaries have different extension
In-Reply-To: <1573738166-12850-1-git-send-email-michael.schenk@noser.com>
References: <1573738166-12850-1-git-send-email-michael.schenk@noser.com>
Message-ID: <20191115072922.4uvgndviwvjj3irb@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Signed-off-by: Michael Schenk <michael.schenk@noser.com>
> ---
>  boot/arm-trusted-firmware/Config.in               | 7 +++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey
