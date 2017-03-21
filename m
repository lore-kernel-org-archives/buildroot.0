From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 22:51:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: fix libusb detection
In-Reply-To: <20170321070926.14178-1-bernd.kuhls@t-online.de>
References: <20170321070926.14178-1-bernd.kuhls@t-online.de>
Message-ID: <20170321225135.2c51ef83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 08:09:26 +0100, Bernd Kuhls wrote:
> gnupg2 does not use pkgconf to detect the include dir of libusb.
> 
> Fixes
> http://autobuild.buildroot.net/results/70c/70c9f5f8ae77fbda2b5eba3aacf831430dc59a1c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnupg2/gnupg2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
