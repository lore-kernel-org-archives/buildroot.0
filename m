From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 8 Mar 2012 23:09:32 +0100
Subject: [Buildroot] Linaro 2012.02 toolchain: pixman build failure
In-Reply-To: <87mx7qeqyf.fsf@macbook.be.48ers.dk>
References: <4F58C7D9.2080205@visionsystems.de>
 <20120308155700.033c9f81@eb-e6520>
 <4F58CEB4.6040908@visionsystems.de> <87mx7qeqyf.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_kt4Q+nrMO5bRK393vFMZUFyegk-Hq0=rv0_qHfSnVZ32w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 8, 2012 at 10:13 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>
> Hi,
>
> ?>>> Any idea?
> ?>>>
> ?>> try to add : --disable-arm-iwmmxt to configure
>
> ?Yegor> Thanks. It is working now. Peter, should we make a patch?
>
> I guess so, but for what configurations? What is the problem exactly?
> That the iwmmxt code doesn't work in thumb2 mode?


I was compiling for cortex-A8. This is what compiler is to provide:
http://gcc.gnu.org/onlinedocs/gcc-4.4.4/gcc/ARM-iWMMXt-Built_002din-Functions.html

I also found this post: http://patches.linaro.org/3962/

Yegor
