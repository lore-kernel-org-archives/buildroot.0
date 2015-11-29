From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:50:20 +0100
Subject: [Buildroot] [PATCH] squashfs: always enable xattr support
In-Reply-To: <1448026455-8146-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1448026455-8146-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151129155020.2546e704@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Fri, 20 Nov 2015 10:34:15 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> In 785fef10 xattr support was disabled, probably because the old version
> did require the xattr package to be present to support it.
> In a409d76e xattr support was made optional via (lib)attr, however the
> squashfs package does in fact include all of the required bits to
> support xattr without the need for the attr package.
> 
> So enable xattr support by default for both the host and target
> variants.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/squashfs/squashfs.mk | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
