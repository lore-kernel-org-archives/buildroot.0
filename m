From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:31:32 +0100
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
 with old distros
In-Reply-To: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
References: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161123233132.135cba4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Nov 2016 11:52:26 +0100, Yann E. MORIN wrote:
> Currently, the br2-external script uses bash-4's associative arrays.
> 
> However, some oldish enterprise-class distros like RHEL5 still use
> bash-3.1 which lacks associative arrays.
> 
> We restore compatibility with those oldish distros using 'eval' to
> emulate associative arrays, as suggested by Arnout.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  support/scripts/br2-external | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
