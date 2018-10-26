From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 20:54:38 +0200
Subject: [Buildroot] [PATCH] zynqmp/post-image.sh: support dots in DTS
 file names
In-Reply-To: <20181025100528.23093-1-francois.beerten@colabti.org>
References: <20181025100528.23093-1-francois.beerten@colabti.org>
Message-ID: <20181026205438.5509e7e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Oct 2018 12:05:28 +0200, francois.beerten at colabti.org wrote:
> From: Francois Beerten <fbeerten.git@colabti.org>
> 
> Some ZynqMP device trees in the kernel have a dot in their name,
> for example "zynqmp-zcu102-rev1.0". The post image script
> left out the part after the dot and created an invalid symlink.
> 
> Signed-off-by: Francois Beerten <fbeerten.git@colabti.org>
> ---
>  board/zynqmp/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
