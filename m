From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:28:58 +0200
Subject: [Buildroot] [PATCH v3 01/10] package/minetest: new package
In-Reply-To: <20170713124052.13708-1-romain.naour@gmail.com>
References: <20170713124052.13708-1-romain.naour@gmail.com>
Message-ID: <20171021172858.1d7d8b86@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 14:40:43 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v3: Simplify Config.in entry (ThomasP)
>     fix Alphabetic ordering (ThomasP)
>     Improve license informations (ThomasP)
>     jpeg removed from mendatory dependencies (minetest client only)
>     Drop Intl patch that was required before BR2_SYSTEM_ENABLE_NLS.
>     Add license hash.
> v2: add package dependencies comments
>     add hash file (Bernd)
>     bump to 0.4.16 (Bernd)
>     version 0.4.15 Tested-by Bernd
>     Add a new patch fixing linking with libintl when necessary
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/minetest/Config.in     | 53 ++++++++++++++++++++++++++++++++++++++++++
>  package/minetest/minetest.hash |  4 ++++
>  package/minetest/minetest.mk   | 44 +++++++++++++++++++++++++++++++++++
>  5 files changed, 103 insertions(+)
>  create mode 100644 package/minetest/Config.in
>  create mode 100644 package/minetest/minetest.hash
>  create mode 100644 package/minetest/minetest.mk

To be honest, we hesitated a bit with this patch series. Indeed
packaging games is really not the priority in Buildroot, and it takes
review time to look at those patches. On the other hand, the patches
were clean, and having a few games for demos is interesting.

The only change I did to the series is to rename minetest_game to
minetest-game, just because - is a nicer separator than _ in package
names.

All applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
