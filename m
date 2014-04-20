From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:41:39 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: toolchain-eclipse-register:
 add toolchain dependency
In-Reply-To: <1397826452-30281-1-git-send-email-fabio.porcedda@gmail.com>
References: <1397826452-30281-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140420174139.3277589a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 18 Apr 2014 15:07:31 +0200, Fabio Porcedda wrote:
> The "toolchain-eclipse-register" target needs the toolchain so add
> toolchain as a dependency.
> This also fix the support to top-level parallel make.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
