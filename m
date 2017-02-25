From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Feb 2017 16:46:19 +0100
Subject: [Buildroot] [PATCH] package/oracle-mysql: fix path to systemd
 service file
In-Reply-To: <1488033083-7295-1-git-send-email-yann.morin.1998@free.fr>
References: <1488033083-7295-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170225164619.76a0728d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 15:31:23 +0100, Yann E. MORIN wrote:
> The path is a remnant from before the rename of the package.
> 
> Rather than hard-code the path, use the available variable. Also use
> that variable when copying the Sys-V init script.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/767/767f0be3894c45c1e6d18bc4528d0da7b50e3757/
>     http://autobuild.buildroot.org/results/e93/e934683ebcb33c9cc8fe9de7b1d5dcd7866f3bce/
>     http://autobuild.buildroot.org/results/5d0/5d04163de80f7900d4aed14cff75b2e0761f101d/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/oracle-mysql/oracle-mysql.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
