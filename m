From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:23:54 +0200
Subject: [Buildroot] [PATCH] f2fs-tools: fix build for uclinux
In-Reply-To: <c5e295a87573a1053f245875ade0b4acda1b61fc.1528913813.git.baruch@tkos.co.il>
References: <c5e295a87573a1053f245875ade0b4acda1b61fc.1528913813.git.baruch@tkos.co.il>
Message-ID: <20180613222354.4e9033d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jun 2018 21:16:53 +0300, Baruch Siach wrote:
> Add a patch making uclinux also linux.
> 
> Fixes:
> http://autobuild.buildroot.net/results/357/3577d413dc16bcec7a403fd8857ec5dd64470ba5/
> http://autobuild.buildroot.net/results/819/819a8a528764a68c02b1b98431a1d09929c387f1/
> http://autobuild.buildroot.net/results/d98/d987df1ea7f8043f05d5221342888892990e9252/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...0001-configure-uclinux-is-also-linux.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
