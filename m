From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 May 2014 15:01:47 -0300
Subject: [Buildroot] [PATCH] package/samba{,4}: disable on nios2
In-Reply-To: <1400867970-13186-1-git-send-email-yann.morin.1998@free.fr>
References: <1400867970-13186-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <537F8D0B.5070708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/23/2014 02:59 PM, Yann E. MORIN wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> samba produces particularly large binaries, and the relocations needed
> for it do not fit in the possible relocation mechanisms available on
> nios2. Since samba is very unlikely to be used on nios2, let's just
> disable it, as we've done for AVR32.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/7b9/7b9dcb537f98714fe57fe384ecbb49bd9ae52aee/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

NIOS2 is a FPGA Softcore so the necessary resources for samba to
work/fit would be extremely expensive (besides the obvious toolchain
problems).
Regards.
