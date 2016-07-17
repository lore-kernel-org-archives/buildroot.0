From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:48:58 +0200
Subject: [Buildroot] [PATCH v5 5/8] package/kodi: add support for libudev
In-Reply-To: <1468260542-7194-5-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
 <1468260542-7194-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160717144858.3157b309@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 20:08:59 +0200, Bernd Kuhls wrote:
> Most of the times this is not needed because libdrm & mesa3d already
> pull in the dependency to udev. Let's add it anyway to make sure that
> udev is really used and to document that Kodi makes use of udev.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v5: initial version in this patch series, fixed typo (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
