From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2016 19:06:03 +0100
Subject: [Buildroot] [PATCH] configs/qemu: enable SMP for x86 & x86_64
In-Reply-To: <568FF3DE.9020903@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 8 Jan 2016 14:37:34 -0300")
References: <1452259790-9223-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3hsdlfj.fsf@dell.be.48ers.dk> <568FF3DE.9020903@zacarias.com.ar>
Message-ID: <87mvsgc5f8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 08/01/16 14:34, Peter Korsgaard wrote:
 >> True. Shouldn't we then change board/qemu/x86*/readme.txt to pass -smp
 >> <n> to qemu?

 > Hi.
 > Maybe, however it's optional, a smp-enabled kernel will boot just fine
 > in UP, and maybe a user doesn't have a SMP host which would probably
 > have a steep price i think (unlikely to be the case, but still).
 > Regards.

True. I've committed it after adding a comment in the two readme's about
the qemu -smp option, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
