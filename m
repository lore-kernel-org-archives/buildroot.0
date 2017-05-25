From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:27:44 +0200
Subject: [Buildroot] [PATCH] gcc: arc: Fix tst_movb pattern
In-Reply-To: <20170524153919.44524-1-abrodkin@synopsys.com>
References: <20170524153919.44524-1-abrodkin@synopsys.com>
Message-ID: <20170525152744.05f96957@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 May 2017 18:39:19 +0300, Alexey Brodkin wrote:
> Fixes building of quagga [1]:
> ------------------------------>8---------------------------  
> 839:1: error: unrecognizable insn:
>  }
>  ^
> (insn 183 24 26 4 (set (reg:CC_ZN 61 cc)
>         (and:SI (reg:SI 0 r0 [orig:192 _12->id.s_addr ] [192])
>             (const_int -256 [0xffffffffffffff00]))) ospf_ri.c:790 -1
>      (nil))
> ospf_ri.c:839:1: internal compiler error: in extract_insn, at recog.c:2287
> ------------------------------>8---------------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
