From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:35:42 +0200
Subject: [Buildroot] [PATCH 1/7] ti-gfx: config help text: list
 supported processors
In-Reply-To: <1468311988-22059-2-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
 <1468311988-22059-2-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160712163542.75eaeeb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:26:22 +0200, Lothar Felten wrote:
> The ti-gfx package supports a set of SGX implementations which are used in
> some TI SoCs, newer parts are not supported by this package.
> This patch adds a list of supported TI SoCs.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  package/ti-gfx/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

However, it cannot be merged until we merge your ti-sgx package, since
your proposed Config.in help text references that package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
