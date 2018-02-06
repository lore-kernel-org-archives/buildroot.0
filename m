From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Feb 2018 14:25:46 -0200
Subject: [Buildroot] [PATCH v2 2/2] xf86-video-armada: new package
In-Reply-To: <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <20180202145526.20133-3-Evgeniy.Didin@synopsys.com>
Message-ID: <CAOMZO5Bb0-Ng=OYi1EqXsKWsQTHuCkO+fyCktcZqCa-GjVaxpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evgeniy,

On Fri, Feb 2, 2018 at 12:55 PM, Evgeniy Didin
<Evgeniy.Didin@synopsys.com> wrote:

> +++ b/package/x11r7/xdriver_xf86-video-armada/xdriver_xf86-video-armada.hash
> @@ -0,0 +1,6 @@
> +# Locally calculated
> +sha256 5df615507ca6579ffba6df8a2aea6f6b542aa3985598efae836f335f9752cb39        xdriver_xf86-video-armada-04748ff4fb30370086cc97b9487a32951c5600ba.tar.gz

I had to manually change the sha256 to
5df615507ca6579ffba6df8a2aea6f6b542aa3985598efae836f335f9752cb39 in
order to fix the mismatch error.

With this fixed:

Tested-by: Fabio Estevam <festevam@gmail.com>
