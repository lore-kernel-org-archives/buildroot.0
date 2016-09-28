From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2016 15:47:52 +0200
Subject: [Buildroot] [PATCH] newt: bump to version 0.52.19
In-Reply-To: <1475070228-18312-1-git-send-email-yegorslists@googlemail.com>
References: <1475070228-18312-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160928154752.778031d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Sep 2016 15:43:48 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed patches and change download location.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...-instead-of-CPP-to-generate-.depend-files.patch | 38 ----------------------
>  ...e-bogus-I-usr-include-slang-from-CPPFLAGS.patch | 33 -------------------
>  package/newt/newt.hash                             |  2 +-
>  package/newt/newt.mk                               |  4 +--
>  4 files changed, 3 insertions(+), 74 deletions(-)
>  delete mode 100644 package/newt/0001-Use-CC-instead-of-CPP-to-generate-.depend-files.patch
>  delete mode 100644 package/newt/0002-Remove-bogus-I-usr-include-slang-from-CPPFLAGS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
