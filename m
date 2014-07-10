From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2014 21:34:34 +0200
Subject: [Buildroot] fakeroot patch
In-Reply-To: <8738e9nhb6.fsf@dell.be.48ers.dk>
References: <CAMai9+qVrXKNEoC-7=aR+s09ytt-MEQaXQiAEpsE_g1voWHA3A@mail.gmail.com>
 <877g3lni3o.fsf@dell.be.48ers.dk>
 <CAMai9+osi=SQp74yhL3qfdsJWawVzZy517aZdw6V67q9sytEOw@mail.gmail.com>
 <8738e9nhb6.fsf@dell.be.48ers.dk>
Message-ID: <20140710193434.GF28300@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeff, Peter, All,

On 2014-07-10 21:29 +0200, Peter Korsgaard spake thusly:
> >>>>> "Jeff" == Jeff Bailey <jeffbailey@google.com> writes:
>  > Correct. ?While most of our builds happen on x86 targeting ppc64le, when doing
>  > development I use the ppc64le system natively to speed up build/test
>  > iterations.
> 
> Ok, and you still use Buildroot for that? Buildroot is really a system for cross
> compilation. Do you do ppc64le->ppc64le cross compilation? How does that
> speed up development?

Also, I'd be very interested to know if all the quirks we're going to
make cross-compilation work effectively on x86, and especially x86->x86,
such as ebnsuring the host devel files do not interfere, are still
working OK on anything else than an x86 as build host.

If at least for that reason, having someone do real-life tests on a
non-x86 build host is very nice, since we can discover bugs that do not
occur on an x86 build host.

I know you, Peter, are running a PPC autobuilder, but that's not really
the same as actually using a PPC machien as a devel machine in a real
project.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
