From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:38:54 +0100
Subject: [Buildroot] [PATCH 0/3 v2] support: better check for a host
 with an UTF8 locale
In-Reply-To: <cover.1480844552.git.yann.morin.1998@free.fr>
References: <cover.1480844552.git.yann.morin.1998@free.fr>
Message-ID: <20161204153854.01f4b1e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 10:43:03 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (3):
>       core: add a kconfig option to require an UTF8 locale on the host
>       package/uclibc: needs a host with an UTF8 locale to build locales
>       support/dependencies: use the new kconfig option to check UTF8 locale

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
