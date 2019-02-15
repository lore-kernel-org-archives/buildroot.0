From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:01:44 +0100
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64le platforms
In-Reply-To: <20190213085111.uuar2ehi7k2htdfg@gmail.com>
References: <20190213085111.uuar2ehi7k2htdfg@gmail.com>
Message-ID: <20190215220144.73a6097b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Artem,

Thanks for the patch.

On Wed, 13 Feb 2019 11:51:11 +0300
Artem Senichev <artemsen@gmail.com> wrote:

> kexec has fully support of ppc64 platform:
> https://www.kernel.org/doc/Documentation/kdump/kdump.txt
> 
> Signed-off-by: Artem Senichev <artemsen@gmail.com>
> ---
>  package/kexec/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next. What about ppc64 big endian, i.e BR2_powerpc64 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
