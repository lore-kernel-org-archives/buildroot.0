From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Feb 2015 18:12:40 +0100
Subject: [Buildroot] [PATCH] perl: remove poisoned path from dynaloader
 hints
In-Reply-To: <20150208163201.GA9741@vostro>
References: <20150208163201.GA9741@vostro>
Message-ID: <20150208181240.5b5ddf8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sun, 8 Feb 2015 18:32:01 +0200, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/323a82776cccf17afaa00ebe3483cfc06a06f264/
> http://autobuild.buildroot.net/results/7d4cf7b63fda1a062263b7a4e758c699049105af/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Thanks! A comment, below.

> ---
>  package/perl/0002-dynaloader-hints.patch | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 package/perl/0002-dynaloader-hints.patch
> 
> diff --git a/package/perl/0002-dynaloader-hints.patch b/package/perl/0002-dynaloader-hints.patch
> new file mode 100644
> index 0000000..5ea11b1
> --- /dev/null
> +++ b/package/perl/0002-dynaloader-hints.patch
> @@ -0,0 +1,10 @@
> + Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Patches not only need a Signed-off-by line, but also a description.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
