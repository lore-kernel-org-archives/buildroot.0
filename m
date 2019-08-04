From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 14:24:11 +0200
Subject: [Buildroot] [PATCH v3] board: Add PowerPC mac99
In-Reply-To: <87d0hlw4tk.fsf@concordia.ellerman.id.au> (Michael Ellerman's
 message of "Sun, 04 Aug 2019 21:25:11 +1000")
References: <20190625012652.21853-1-joel@jms.id.au>
 <87wofwx4ni.fsf@dell.be.48ers.dk>
 <CACPK8XfC=f5t+=KwmzTHDR-KedP0nLkgf8YHcRv+NpVVZ5ikDw@mail.gmail.com>
 <87d0hlw4tk.fsf@concordia.ellerman.id.au>
Message-ID: <87lfw915lg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Ellerman <mpe@ellerman.id.au> writes:

Hi,

 >>> With that said, we now have 4 32bit ppc qemu defconfigs which sounds
 >>> like a lot to me. Are they all still interesting / useful?
 >> 
 >> I am not familiar with them. Michael?

 > Well the kernel has ~100 different configs, so 4 seems like a fairly
 > small number in comparison :)

So do we ;)

ls configs/*_defconfig | wc -l
213

 > None of the 32-bit powerpc platforms are really under heavy development
 > any more, but they are still used by various people. It's hard to say
 > how many of those people are also using buildroot.

Ok, lets just leave them for now. Thanks!

-- 
Bye, Peter Korsgaard
