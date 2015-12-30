From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:58:14 +0100
Subject: [Buildroot] [PATCH 1/3] vboot-utils: MTD_CHAR_MAJOR definition
In-Reply-To: <8ab37f6789bea6e1e6bcf070c8234f970d9fae77.1451483256.git.alex.suykov@gmail.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <8ab37f6789bea6e1e6bcf070c8234f970d9fae77.1451483256.git.alex.suykov@gmail.com>
Message-ID: <20151230155814.001cd370@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Wed, 30 Dec 2015 16:05:30 +0200, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/a6360fd21314899321071c34fcb4892c5eed9bcc/
> http://autobuild.buildroot.net/results/0af3aa4a429c45d3a2609913ec1040f32378f3c8/
> http://autobuild.buildroot.net/results/cc4940fd6f51b31d71014f5aedee5223180eb36e/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/vboot-utils/0001-mtd-char-major.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/vboot-utils/0001-mtd-char-major.patch

Applied, thanks. It would have been nicer to have a Git formatted
patch, though.

I'm not sure if it's possible, but if you could submit this patch
to the upstream ChromiumOS project, it would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
