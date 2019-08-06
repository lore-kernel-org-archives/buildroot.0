From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:18:23 +0200
Subject: [Buildroot] [PATCH 3/6] autobuild-run: fix cross tools prefix
 for diffoscope
In-Reply-To: <20190806181251.21885-3-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
 <20190806181251.21885-3-itsatharva@gmail.com>
Message-ID: <20190806221823.72a7c375@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 23:42:48 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Make outputs "make: entering directory" when called from a different
> directory which is unnecessary and yields a wrong prefix. Adding this
> argument supresses unnecessary output and yields the right prefix.
> 
> Before and after: https://gitlab.com/snippets/1877119
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
