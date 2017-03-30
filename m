From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Mar 2017 22:07:35 +0200
Subject: [Buildroot] [PATCH 1/1] libmediaart: fix qt5 build
In-Reply-To: <1490898877-4000-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1490898877-4000-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170330220735.7a01e263@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Mar 2017 20:34:37 +0200, Fabrice Fontaine wrote:
> Use BR2_PACKAGE_QT5_VERSION_LATEST instead of BR2_QT5_VERSION_LATEST
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmediaart/libmediaart.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
