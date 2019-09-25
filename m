From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:29:50 +0200
Subject: [Buildroot] [PATCH v2] package/gcc: backport fix for xtensa PR
 90922
In-Reply-To: <20190923204703.18313-1-jcmvbkbc@gmail.com>
References: <20190923204703.18313-1-jcmvbkbc@gmail.com>
Message-ID: <20190925222950.33ac6aef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 13:47:03 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Stack pointer adjustment code in xtensa call0 ABI prologue missed a case
> of no callee-saved registers and a stack frame size bigger than 128 bytes.
> Handle that case.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Changes v1->v2:
> - fix subject line

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
