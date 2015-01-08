From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:35:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: "/bin/bash" =>
 "/usr/bin/env bash" shebang
In-Reply-To: <1420749079-29099-1-git-send-email-bjorn.forsman@gmail.com>
References: <1420749079-29099-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20150108213529.7ca0e484@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Thu,  8 Jan 2015 21:31:19 +0100, Bj?rn Forsman wrote:
> For portability. All other Buildroot scripts (i.e. scripts that run on
> host) already use the "/usr/bin/env bash" shebang.
> 
> This change is needed for NixOS, which lacks a global /bin/bash.
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  package/mke2img/mke2img | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

(See: we can be fast! :-))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
