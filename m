From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 21:08:46 +0200
Subject: [Buildroot] [PATCH 1/2] libnss: drop obsolete patch
In-Reply-To: <d20e1c9116d8625fce1f4db9b44c4ab009fbba40.1530008903.git.baruch@tkos.co.il>
References: <d20e1c9116d8625fce1f4db9b44c4ab009fbba40.1530008903.git.baruch@tkos.co.il>
Message-ID: <20180626210846.5cef0830@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 13:28:22 +0300, Baruch Siach wrote:
> uClibc implements RTLD_NOLOAD for quite some time now. Remove the patch
> adding a dummy definition of RTLD_NOLOAD.
> 
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libnss/0001-uclibc.patch | 20 --------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 package/libnss/0001-uclibc.patch

Both applied. I fixed the commit message of the second patch to include
the autoubuilder references. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
