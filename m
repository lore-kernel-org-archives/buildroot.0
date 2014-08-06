From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 22:18:11 +0200
Subject: [Buildroot] [PATCH 1/2] python3: fix termios build for xtensa
In-Reply-To: <5bbe7610b89e16341ca9456ae5b8aad67652b61b.1407349862.git.baruch@tkos.co.il>
References: <5bbe7610b89e16341ca9456ae5b8aad67652b61b.1407349862.git.baruch@tkos.co.il>
Message-ID: <20140806221811.13b2ea64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed,  6 Aug 2014 21:31:01 +0300, Baruch Siach wrote:
> Forward port the patch from c821210b1bfa (python: fix termios build for
> xtensa) to python3.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e7f/e7f71fbcb0796f315052947382fa39d85c5dc8fe/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../python3-014-serial-ioctl-workaround.patch      | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/python3/python3-014-serial-ioctl-workaround.patch

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
