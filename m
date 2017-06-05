From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:08:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: fix build when c++
 support is disabled
In-Reply-To: <20170605113010.3119-1-bernd.kuhls@t-online.de>
References: <20170605113010.3119-1-bernd.kuhls@t-online.de>
Message-ID: <20170605150829.16146ea0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 13:30:10 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/c04/c04ff29b83c020573add597c355c57a6d9c9761d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-cmake-allow-build-without-c.patch         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/hiawatha/0001-cmake-allow-build-without-c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
