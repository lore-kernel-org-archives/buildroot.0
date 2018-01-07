From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:51:14 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: bump to 0.22.1
In-Reply-To: <20180105163223.10142-1-romain.naour@gmail.com>
References: <20180105163223.10142-1-romain.naour@gmail.com>
Message-ID: <20180107235114.29989985@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Jan 2018 17:32:23 +0100, Romain Naour wrote:
> See https://www.enlightenment.org/news/e22_release and
> https://www.enlightenment.org/news/e0.22.1_release
> 
> Switch to the meson build system.
> 
> The autotools build system has been removed upstream by commit
> https://git.enlightenment.org/core/enlightenment.git/commit/?id=bd8828204779509a2f47fffc4031abcab2b34d79
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> ---
>  package/enlightenment/enlightenment.hash |  4 ++--
>  package/enlightenment/enlightenment.mk   | 41 +++++++++++++++++++++++---------
>  2 files changed, 32 insertions(+), 13 deletions(-)

Applied to master after using --option=value consistently, as pointed
out in my earlier e-mail. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
