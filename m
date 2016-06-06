From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:21:04 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: remove
 BR2_PACKAGE_BOOST_ARCH_SUPPORTS option, 2nd try
In-Reply-To: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160606232104.73631015@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 15:13:00 +0200, Bernd Kuhls wrote:
> For whatever reason this commit
> https://git.busybox.net/buildroot/commit/package/kodi?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
> did not make it into the master branch preventing to select the Kodi
> package in menuconfig.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
