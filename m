From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:54:48 +0200
Subject: [Buildroot] [PATCH] aiccu: fix uclibc builds
In-Reply-To: <20150330111339.GA30483@vostro>
References: <20150330111339.GA30483@vostro>
Message-ID: <20150330175448.16518da9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Mon, 30 Mar 2015 14:13:39 +0300, Alex Suykov wrote:
> uClibc defines __GLIBC__ but does not provide res_nquery.
> 
> Fixes:
> http://autobuild.buildroot.net/results/17248fa7f4deaacdab9bb22a777f51209af11e60/
> http://autobuild.buildroot.net/results/bf155246563e2f6c44e18f7ee423305600a68b7e/
> http://autobuild.buildroot.net/results/32a8c566604e79bf2de7d7236b49b6ab40b8cefd/
> http://autobuild.buildroot.net/results/4093e4679412b50048860299dcfc301927e2cabc/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/aiccu/0005-res-ninit.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
