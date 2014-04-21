From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:23:30 +0200
Subject: [Buildroot] [PATCH 1/1] sunxi-mali: add missing GLchar
 definitions.
In-Reply-To: <1398102582-16743-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1398102582-16743-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140421222330.190b6135@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 21 Apr 2014 19:49:42 +0200, Eric Le Bihan wrote:
> The GLES and GLES2 header files provided by sunxi-mali do not define the
> type "GLchar" and use "char" instead in the prototype of some functions.
> 
> In order to have some applications build (like cairo), a new patch has
> been added to define the missing type.
> 
> This issue has been reported upstream some time ago, but the pull
> request has not been merged yet.
> (See https://github.com/linux-sunxi/sunxi-mali/pull/8).
> 
> Fixes http://autobuild.buildroot.net/results/2cb/2cb13a5bb92dabed219d49f49f0b9a2dfe65a0ca/.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...-mali-0001-Add-missing-GLchar-definitions.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/sunxi-mali/sunxi-mali-0001-Add-missing-GLchar-definitions.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
