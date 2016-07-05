From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:31:22 +0200
Subject: [Buildroot] [PATCH] package/rs485conf: new package
In-Reply-To: <20160705083850.13914-1-m.niestroj@grinn-global.com>
References: <20160705083850.13914-1-m.niestroj@grinn-global.com>
Message-ID: <20160705153122.1cda975c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 10:38:50 +0200, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/Config.in                |  1 +
>  package/rs485conf/Config.in      |  9 +++++++++
>  package/rs485conf/rs485conf.hash |  2 ++
>  package/rs485conf/rs485conf.mk   | 20 ++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/rs485conf/Config.in
>  create mode 100644 package/rs485conf/rs485conf.hash
>  create mode 100644 package/rs485conf/rs485conf.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
