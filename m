From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:45:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/spice: depend on libglib2
In-Reply-To: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221234554.3628abba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:40:07 +0100, Bernd Kuhls wrote:
> The package selects BR2_PACKAGE_LIBGLIB2 but did not depend on it.
> 
> The buildsystem treats libglib2 as a hard-dependency:
> https://cgit.freedesktop.org/spice/spice/tree/configure.ac?h=0.12#n117
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/spice/spice.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
