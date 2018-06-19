From: Jan Kraval <jan.kraval@gmail.com>
Date: Tue, 19 Jun 2018 09:03:15 +0200
Subject: [Buildroot] [PATCH 2/2] configs/orangepi_lite: Enable HDMI and
 analog audio in Linux config
In-Reply-To: <20180618074826.pud3rpikt7xzv5sg@flea>
References: <20180611170113.9305-1-jan.kraval@gmail.com>
 <20180611170113.9305-2-jan.kraval@gmail.com>
 <20180618074826.pud3rpikt7xzv5sg@flea>
Message-ID: <f5b5fca3-9f81-d367-f80d-f4b20955cd73@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,


On 18.6.2018 09:48, Maxime Ripard wrote:
> Hi,
>
> Why haven't those changes been submitted to the upstream defconfig?
>
> Maxime
>

I don' know why 4.17 doesn't enable it in sunxi_defconfig. I suspected 
that it's because there are boards without HDMI output so it's kept 
disabled. I tested clean 4.17 on my Lite and HDMI worked only in u-boot. 
Then I saw 
https://git.buildroot.net/buildroot/commit/?id=a96100599071055e6daad1211f68b022c86a25c1, 
which enables HDMI on Opi-PC. I tested it on Lite and it worked, so I 
just submitted it.

Jan
