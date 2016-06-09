From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:08:03 +0200
Subject: [Buildroot] [PATCH] gsettings-desktop-schemas: new package
In-Reply-To: <1464037683-1354-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464037683-1354-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160609220803.75d7aa7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 18:08:03 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                        |  1 +
>  package/gsettings-desktop-schemas/Config.in              | 16 ++++++++++++++++
>  .../gsettings-desktop-schemas.hash                       |  2 ++
>  .../gsettings-desktop-schemas.mk                         | 16 ++++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/gsettings-desktop-schemas/Config.in
>  create mode 100644 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
>  create mode 100644 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
