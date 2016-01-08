From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2016 18:34:56 +0100
Subject: [Buildroot] [PATCH] configs/qemu: enable SMP for x86 & x86_64
In-Reply-To: <1452259790-9223-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 8 Jan 2016 10:29:50 -0300")
References: <1452259790-9223-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3hsdlfj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > This is the 21st century, so enable SMP for them.

True. Shouldn't we then change board/qemu/x86*/readme.txt to pass -smp
<n> to qemu?

-- 
Bye, Peter Korsgaard
