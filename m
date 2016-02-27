From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:25:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/qhull: fix comment dependency
In-Reply-To: <1456578818-32619-1-git-send-email-romain.naour@gmail.com>
References: <1456578818-32619-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160227162505.1e48688f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Feb 2016 14:13:37 +0100, Romain Naour wrote:
> The comment must be displayed with toolchain without C++ compiler support when
> BR2_STATIC_LIBS is not set.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/qhull/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
