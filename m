From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Wed, 28 Aug 2013 13:30:58 -0300
Subject: [Buildroot] [PATCH v2 0/2] Introducing Nios-II architecture
In-Reply-To: <20130828181818.2efd6bf5@skate>
References: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130828181818.2efd6bf5@skate>
Message-ID: <CAAEAJfBUUm5vefFKOctxYQdLxD3NS=pbVt=knQsoKcjqdZ-Vtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 August 2013 13:18, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ezequiel Garcia,
>
> On Wed, 21 Aug 2013 16:58:46 -0300, Ezequiel Garcia wrote:
>> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>
>> This is the second version of the series adding basic support for
>> Altera's Nios-II architecture.
>> Only basic support added so far, but more patches will hopefully follow.
>
> Nice!
>
> Once this series is committed, I'll add NIOS-II to the autobuilders.
> Are you willing to look at the resulting package build failures?
>

Sure. However, not all of them will be easy to fix, I'm afraid.

I'm currently *trying* to port strace, which is probably one of the most
important package lacks we currently have.

> What's nice is that the toolchain is modern: gcc 4.7, glibc 2.17,
> binutils 2.23. Hopefully, this will mean that the number of issues
> should not be too huge.
>

Indeed. I'm trying to follow the toolchain mainline process so
I hope we'll be able to support the internal toolchain soon!
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
