From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 19:21:36 +0200
Subject: [Buildroot] [PATCH] package/pkg-cmake.mk: rename
 _INSTALL_HOST_OPTS -> _INSTALL_OPTS
In-Reply-To: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
References: <1412443142-12817-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141004192136.0df6ae55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat,  4 Oct 2014 19:19:02 +0200, Samuel Martin wrote:
> This pacth renames, consistently with the other package infrastructures,
> the _INSTALL_OPTS variable for host CMake-based package.
> 
> As mentioned in [1], no host-cmake-package uses this variable so far; so
> it is a safe rename.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-October/107712.html
> 
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What about the manual?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
