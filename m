From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 18:06:34 +0200
Subject: [Buildroot] [PATCH] package/sphinxbase: add missing
 dependencies host-bison
In-Reply-To: <1467733914-4660-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467733914-4660-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160705180634.66b14ab5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 17:51:54 +0200, Maxime Hadjinlian wrote:
> Fix autobuilder:
> http://autobuild.buildroot.net/results/741/741f04fce74b4dfc4d4405d14c82c21f67cbfff1/
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/sphinxbase/sphinxbase.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied with a minor tweak to the commit title: "add missing dependency
on host-bison".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
