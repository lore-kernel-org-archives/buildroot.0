From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:13:24 +0200
Subject: [Buildroot] [PATCH v7 2/2] systemd: select fsck wrapper from
 util-linux
In-Reply-To: <1491997369-21394-3-git-send-email-casantos@datacom.ind.br>
References: <1491997369-21394-1-git-send-email-casantos@datacom.ind.br>
 <1491997369-21394-3-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170412211324.708186ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 08:42:49 -0300, Carlos Santos wrote:
> Select the fsck required by systemd provided by util-linux. This
> prevents ending up with fsck from busybox, which is incompatible
> with systemd.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> [there were no v1, v2]
> Changes v3
>   - Select e2fsprogs + e2fsck
> Changes v3->v4
>   - Remove selection of e2fsprogs + e2fsck
>   - Clean-up commit message
> Changes v4->v5
>   - Screwed-up everything, reverting the chances made in v4
> Changes v5->v6
>   - Restored changes made in v4.
>   - Restore the patch changelog.
> Changes v6->v7
>   - Removed spurious Change-Id from commit message.
> ---
>  package/systemd/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
