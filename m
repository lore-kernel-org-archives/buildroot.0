From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:55:33 +0100
Subject: [Buildroot] [PATCH 2/8] package/checkpolicy: rename variable
In-Reply-To: <cd9656c5aa72066e68f41700b9f4e27db013386d.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <cd9656c5aa72066e68f41700b9f4e27db013386d.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201225533.1b85ff3a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:39 +0100, Yann E. MORIN wrote:
> We use package names as poor-man's namespace, so fix that.
> 
> Reported by utils/check-package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/checkpolicy/checkpolicy.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, after doing the following change:

    [Thomas: use CHECKPOLICY_MAKE_OPTS instead of
    CHECKPOLICY_TARGET_MAKE_OPTS, as it is more consistent with
    HOST_CHECKPOLICY_MAKE_OPTS being used for the host variant.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
