From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:23:26 +0100
Subject: [Buildroot] [PATCH v2/next 1/1] package/x11r7/libepoxy: bump to
 version 1.3.1
In-Reply-To: <1439037798-30471-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439037798-30471-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219142326.36257394@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  8 Aug 2015 14:43:17 +0200, Bernd Kuhls wrote:
> Removed call to pkgconf because epoxy configure now uses pkgconf
> itself to find egl headers:
> https://github.com/anholt/libepoxy/commit/d56f21c494b315306215c4730835a9b291360e9b
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Removed pkgconf to find rpi headers

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
