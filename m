From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 09:07:52 +0100
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64 platform
In-Reply-To: <20190218121508.htf6s7bazcggmozg@gmail.com>
References: <20190218121508.htf6s7bazcggmozg@gmail.com>
Message-ID: <20190327090752.75895bad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Feb 2019 15:15:08 +0300
Artem Senichev <artemsen@gmail.com> wrote:

> kexec has fully support of ppc64 platform:
> https://www.kernel.org/doc/Documentation/kdump/kdump.txt
> Added BR2_powerpc64 platform support.
> 
> Signed-off-by: Artem Senichev <artemsen@gmail.com>
> ---
>  package/kexec/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
