From: Heiko Zuerker <heiko@zuerker.org>
Date: Thu, 09 Dec 2010 12:43:28 -0600
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <201012091942.18191.yann.morin.1998@anciens.enib.fr>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D0112E5.301@zacarias.com.ar>
	<20101209122657.12946lktv4rsa84k@www.home.zuerker.org>
	<201012091942.18191.yann.morin.1998@anciens.enib.fr>
Message-ID: <20101209124328.16404zvi6ek9q1gc@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>:

> Heiko, All,
>
> On Thursday 09 December 2010 19:26:57 Heiko Zuerker wrote:
>> It now blows up because it can't find xtables.h. Seems like the
>> external toolchain (ct-ng 1.9.0) didn't include that from the kernel.
>> I'll do some more testing on it.
>
> xtables.h does not exist in linux-2.6.36, so it can not be installed. ;-)

CT_KERNEL_VERSION="2.6.32.25" :D

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
