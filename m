From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:54:34 +0100
Subject: [Buildroot] [PATCH 3/3] snowball-{hdmiservice,
 init}: remove packages
In-Reply-To: <1478352758-28778-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478352758-28778-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1478352758-28778-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161109225434.67b9bcc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 14:32:38 +0100, Thomas Petazzoni wrote:
> The snowball_defconfig has been removed one year ago in commit
> b3fa8e24defb20e1734e7e75f432090fe83c0dd8 ("configs: remove
> calao_snowball_defconfig"), and it's no longer possible to buy
> Snowball boards. Therefore, there is no reason to keep the
> snowball-related packages in our tree.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in.legacy                                   | 14 ++++++++++++
>  package/Config.in                                  |  2 --
>  package/snowball-hdmiservice/Config.in             | 14 ------------
>  .../snowball-hdmiservice/snowball-hdmiservice.hash |  2 --
>  .../snowball-hdmiservice/snowball-hdmiservice.mk   | 25 ----------------------
>  package/snowball-init/Config.in                    | 17 ---------------
>  package/snowball-init/snowball-init.hash           |  2 --
>  package/snowball-init/snowball-init.mk             | 16 --------------
>  8 files changed, 14 insertions(+), 78 deletions(-)
>  delete mode 100644 package/snowball-hdmiservice/Config.in
>  delete mode 100644 package/snowball-hdmiservice/snowball-hdmiservice.hash
>  delete mode 100644 package/snowball-hdmiservice/snowball-hdmiservice.mk
>  delete mode 100644 package/snowball-init/Config.in
>  delete mode 100644 package/snowball-init/snowball-init.hash
>  delete mode 100644 package/snowball-init/snowball-init.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
