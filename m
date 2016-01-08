From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 8 Jan 2016 14:37:34 -0300
Subject: [Buildroot] [PATCH] configs/qemu: enable SMP for x86 & x86_64
In-Reply-To: <87r3hsdlfj.fsf@dell.be.48ers.dk>
References: <1452259790-9223-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3hsdlfj.fsf@dell.be.48ers.dk>
Message-ID: <568FF3DE.9020903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/16 14:34, Peter Korsgaard wrote:

> True. Shouldn't we then change board/qemu/x86*/readme.txt to pass -smp
> <n> to qemu?

Hi.
Maybe, however it's optional, a smp-enabled kernel will boot just fine 
in UP, and maybe a user doesn't have a SMP host which would probably 
have a steep price i think (unlikely to be the case, but still).
Regards.
