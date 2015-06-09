From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 21:40:29 +0200
Subject: [Buildroot] [PATCH 1/3] mc: change tarball compression to xz
In-Reply-To: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150609214029.30e92753@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Mon,  8 Jun 2015 23:46:05 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/mc/mc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied, after squashing patch 2 into patch 1 as suggested by
Arnout. Without doing this, if only patch 1 was applied, you would
have broken the build of the mc package: when a hash file exists, it
*must* have the hashes of all files downloaded by the package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
