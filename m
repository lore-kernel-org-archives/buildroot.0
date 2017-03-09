From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Mar 2017 23:17:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-03-07
In-Reply-To: <874lz2ayub.fsf@dell.be.48ers.dk>
References: <20170308072845.15B9C207FC@mail.free-electrons.com>
 <e0aecdb6-c5b8-db8e-8113-9a76c7a466ba@cdf123.net>
 <20170308233230.7c2a12f2@free-electrons.com>
 <874lz2ayub.fsf@dell.be.48ers.dk>
Message-ID: <20170309221754.GC3785@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Chris, All,

On 2017-03-09 23:07 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  >> > Build failures related to your packages:
>  >> > 
>  >> >     mips64el | firejail-0.9.44.8 |
>  >> > http://autobuild.buildroot.net/results/84d9b5dc955895e1a1c1074e3917c44c8fc00365
> 
>  > I see two things here:
> 
>  > common.c:48: error: '__NR_setns' undeclared (first use in this function)
> 
>  > This *could* be related to too old kernel headers, I guess setns() is a
>  > fairly modern system call.
> 
> That was my thought as well, but it looks like setns was added in 3.7
> for mips, and this toolchain is using 3.9.
> 
> I did a quick 'make firejail' with that defconfig, and I cannot
> reproduce the issue here :/

Same here. I even rebuilt in my autobuilder chroot, and still no luck:
it builds fine for me here... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
