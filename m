From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:20:05 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: fix compilation with some
 toolchains
In-Reply-To: <1431692800-15539-1-git-send-email-lionel.orry@gmail.com>
References: <1431692800-15539-1-git-send-email-lionel.orry@gmail.com>
Message-ID: <20150516142005.745583d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Fri, 15 May 2015 14:26:40 +0200, Lionel Orry wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d9ec39dc5829aac1b25bfea7484458fcebd68412/
> 
> add cstdlib header to ensure EXIT_FAILURE presence
> 
> Using some cross-compiling toolchains, EXIT_FAILURE is not always
> properly defined without this inclusion.
> 
> Patch is upstream:
> https://github.com/zeromq/zmqpp/pull/109
> 
> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
> ---
>  package/zmqpp/0001-add-ctsdlib-header.patch | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/zmqpp/0001-add-ctsdlib-header.patch

I've applied your patch, but I've replaced the patch you included which
was just the output of 'git show' or 'git log -p' by a patch properly
formatted with 'git format-patch', so that it can be applied with 'git
am'.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
