From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Mon, 15 Aug 2011 09:25:45 -0400
Subject: [Buildroot] about TARGET_CROSS
In-Reply-To: <87liuwh41m.fsf@macbook.be.48ers.dk>
References: <CAAa76NR2f4jkSem4vx1_-K5OjK-v567kU98zDP8skN+=eX-zGA@mail.gmail.com>
 <87liuwh41m.fsf@macbook.be.48ers.dk>
Message-ID: <CAAa76NSiUdAeRQEA+M1gmUfEoOuh3SOynVbb_Ly1D0V6U0KudA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 14, 2011 at 2:59 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "raymond" == raymond zhao <raymond.zhao.ml@gmail.com> writes:
>
> ?raymond> Hi,
> ?raymond> There is a variable named TARGET_CROSS in the Makefile.in under
> ?raymond> buildroot/package directory. It is used for lots of package build
> ?raymond> command. The problem is that it end with "-". Some packages add that
> ?raymond> "-" itself in their own building system. These kind of packages will
> ?raymond> complain that it can not find the compiler, for instance,
> ?raymond> powerpc-unknown-linux-gnu--gcc. Please note that there are two "-"
> ?raymond> before gcc. Use makefile string functions to strip out the last "-" is
> ?raymond> not easy. So I suggest we add another variable named
> ?raymond> TARGET_CROSS_STRIP, which is another version of TARGET_CROSS without
> ?raymond> the last "-".
> ?raymond> Here is the modification. I did not use patch format since it is very
> ?raymond> simple modification.
>
> I have no problem with that, but what packages are we talking about?
>
> Please submit this change together with the package(s) which needs it.
>
> --
> Bye, Peter Korsgaard
>
I can not submit the package. It is eXtremDB, it is not an free package.
