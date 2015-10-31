From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 15:57:14 +0100
Subject: [Buildroot] [PATCH v2] fs/ext2: add options for extra space and
 extra inodes
In-Reply-To: <1446149436-9126-1-git-send-email-yann.morin.1998@free.fr>
References: <1446149436-9126-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151031155714.662acf22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 29 Oct 2015 21:10:36 +0100, Yann E. MORIN wrote:
> Add two options to the ext2 filesystem, one to add extra free space, one
> to add extra free inodes.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2:
>   - fix typo in commit log  (Martin & Gustavo)
> ---
>  fs/ext2/Config.in       | 20 ++++++++++++++++++--
>  fs/ext2/ext2.mk         |  2 ++
>  package/mke2img/mke2img |  8 +++++++-
>  3 files changed, 27 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
