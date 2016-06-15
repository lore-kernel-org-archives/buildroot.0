From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 15:09:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: Add suboption to control
 MySQL support
In-Reply-To: <1465938028-8149-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465938028-8149-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160615150946.7bef4659@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jun 2016 23:00:27 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 6 ++++++
>  package/kodi/kodi.mk   | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)

What is the motivation for switching from an "automatic" enabling to an
explicit sub-option ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
