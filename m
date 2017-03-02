From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 11:42:20 +0100
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add csky developer
In-Reply-To: <1488450842-29100-4-git-send-email-ren_guo@c-sky.com>
References: <1488450842-29100-1-git-send-email-ren_guo@c-sky.com>
 <1488450842-29100-4-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170302114220.141a883c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 18:34:02 +0800, Guo Ren wrote:
> You can get more info from github.com/c-sky.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  DEVELOPERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1bf07c3..cd4402f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -592,6 +592,11 @@ F:	package/sdl2/
>  N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
>  F:	package/liquid-dsp/
>  
> +N:	Guo Ren <ren_guo@c-sky.com>
> +F:	arch/Config.in.csky

This should be part of the patch adding the architecture.

> +F:	board/csky
> +F:	configs/csky_*

And this of the patch adding the board.

But overall: this series looks almost good to go. I think the next
iteration will be OK. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
