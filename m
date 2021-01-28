From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jan 2021 22:02:14 +0800
Subject: [Buildroot] [PATCH] package/uboot-tools: drop redundant
 parentheses
In-Reply-To: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
References: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
Message-ID: <CAEUhbmUNqNkyzRHYz-iw54w47NLiQGg1Bwze64Ho8TY2Y1i21Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 28, 2021 at 8:33 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Commit d8db91fc6fa ("package/uboot-tools: resolve host uboot env/script
> error") introduced closing parentheses that is not matched and not
> needed.
>
> Fixes:
> http://autobuild.buildroot.net/results/a65/a65fcc581f56ef70154f83e80f12d64f2e0f856a/
> http://autobuild.buildroot.net/results/39a/39aabb9d8afcdead1d620e081d2cd43ee2d61fbc/
>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/uboot-tools/uboot-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

I was about to send exactly the same patch :)

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
