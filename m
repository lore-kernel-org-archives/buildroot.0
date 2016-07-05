From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 19:14:48 +0200
Subject: [Buildroot] [PATCH] dante: New package
In-Reply-To: <1467449278-3166-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467449278-3166-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160705191448.19410d6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 10:47:58 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in           |  1 +
>  package/dante/Config.in     |  9 +++++++++
>  package/dante/S50dante      | 40 ++++++++++++++++++++++++++++++++++++++++
>  package/dante/dante.hash    |  2 ++
>  package/dante/dante.mk      | 32 ++++++++++++++++++++++++++++++++
>  package/dante/dante.service | 15 +++++++++++++++
>  6 files changed, 99 insertions(+)
>  create mode 100644 package/dante/Config.in
>  create mode 100644 package/dante/S50dante
>  create mode 100644 package/dante/dante.hash
>  create mode 100644 package/dante/dante.mk
>  create mode 100644 package/dante/dante.service

This package fails to build on SPARC64:

   http://autobuild.buildroot.net/results/b2d/b2d136c859fff72290006a6fafa624aa12f96d0c/build-end.log

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
