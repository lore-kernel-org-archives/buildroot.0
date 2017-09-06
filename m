From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 14:14:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/pngquant: bump version to 2.10.1
In-Reply-To: <20170904180318.12131-1-bernd.kuhls@t-online.de>
References: <20170904180318.12131-1-bernd.kuhls@t-online.de>
Message-ID: <20170906141432.50db7dfd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 20:03:18 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/pngquant/pngquant.hash | 4 ++--
>  package/pngquant/pngquant.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This bump fails on pretty much all architectures/configurations:

  http://autobuild.buildroot.net/?reason=pngquant-2.10.1

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
