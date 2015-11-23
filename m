From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:28:40 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix broken symlinks
In-Reply-To: <20151123164743.GA28906@waldemar-brodkorb.de>
References: <20151123164743.GA28906@waldemar-brodkorb.de>
Message-ID: <20151123182840.0ba2cccb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 23 Nov 2015 17:47:43 +0100, Waldemar Brodkorb wrote:
> The created symlinks are wrong.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/jimtcl/jimtcl.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 (runtime testing before and after the patch. Before the patch: cannot
 run jimsh due to the library being improperly installed)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
