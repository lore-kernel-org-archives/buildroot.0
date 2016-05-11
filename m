From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:24:37 +0200
Subject: [Buildroot] [PATCH 02/13 v7] core/legal-info: use the helper to
 install source archives
In-Reply-To: <84c5747e72fbcb03c644e27d4c0a79402d50f2d3.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <84c5747e72fbcb03c644e27d4c0a79402d50f2d3.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160511232437.65c76f28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:27 +0200, Yann E. MORIN wrote:
> .. and use $(Q) instead of a hard-coded @.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v6 -> v7:
>   - directly call the wrapper without the variable pointing to it
>     (Arnout)
>   - fix left-over comma  (Arnout)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
