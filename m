From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 2 May 2016 12:42:40 -0300
Subject: [Buildroot] [PATCH] x264: needs mmu
In-Reply-To: <87eg9kqxmk.fsf@dell.be.48ers.dk>
References: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
 <87inywqy9f.fsf@dell.be.48ers.dk> <572771B9.6080807@zacarias.com.ar>
 <87eg9kqxmk.fsf@dell.be.48ers.dk>
Message-ID: <57277570.9060404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/16 12:37, Peter Korsgaard wrote:

> Ok - Thomas, do you know if madvise generally isn't available or if it
> is something specific to the binary bfin toolchain?
>
> I'll kick off a build with our new stm32f defconfig and look.

Ostensibly madvise() can be thrown away if the target doesn't support 
it, though it would require submitting a bunch of patches upstream ;)
Regards.
