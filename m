From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 9 Jun 2014 11:09:00 -0300
Subject: [Buildroot] [RFC/PATCH] linux: add external initramfs options
In-Reply-To: <538F9DD7.6020102@mind.be>
References: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
 <5386131B.6090809@mind.be> <20140604204505.GA19703@arch.cereza>
 <538F9DD7.6020102@mind.be>
Message-ID: <20140609140900.GA23641@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05 Jun 12:29 AM, Arnout Vandecappelle wrote:
[..]
> 
>  Actually, in your case the easiest solution would be to build the kernel
> together with the initramfs-buildroot and use the initramfs rootfs instead of
> the cpio one. In the real-rootfs-buildroot you don't need to build a kernel.
> 

Right, that sounds like a better plan.

Thanks a lot for the feedback,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
