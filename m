From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 11:20:09 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <CAFt09wOGVX9rhSgw_5MAvcEj07Vja5F79BkGbBf+UhfZC3GcpQ@mail.gmail.com>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <D7AD0BF6-2CCF-405D-A7AD-3879A9EA2451@embedded.rocks>
 <CAFt09wOGVX9rhSgw_5MAvcEj07Vja5F79BkGbBf+UhfZC3GcpQ@mail.gmail.com>
Message-ID: <20160817092009.GA5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, J?rg, All,

On 2016-08-16 21:27 -0500, Matthew Weber spake thusly:
> On Fri, Aug 12, 2016 at 4:31 AM, J?rg Krause
> <joerg.krause@embedded.rocks> wrote:
> > Am 10. August 2016 16:14:55 MESZ, schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> >>Please find below the usual analysis of build failures. Hiroshi,
> >>Waldemar, Gustavo, Fabrice, Yann, Dagg, J?rg, Vivien, Vicente, Samuel,
> >>Peter, Joris, Alistair, please have a look below, there's some fun
> >>stuff for you! :-) Thanks for your help.
> >>
> >>Thomas
> >>
> >>On Wed, 10 Aug 2016 08:30:29 +0200 (CEST), Thomas Petazzoni wrote:
> >>
> >>>       x86_64 |                 libtirpc-1.0.1 | NOK |
> >>http://autobuild.buildroot.net/results/715c3ff13844a030767a49731069183aa02cc5f2/
> >>
> >>config.status: error: cannot find input file: `rpcgen/Makefile.in'
> >>
> >>J?rg, you've done quite some work on libtirpc, could you have a look at
> >>this issue?
> >
> > I am on vacation until the end of next week. Sorry, someone else maybe?
> 
> Took a look at this and it doesn't seem to be consistently repeatable
> ( I have yet to see it fail).  I went back and it looks like this
> occasionally has popped up starting on 8/6 and 8/9 on the following
> architectures.
> 
> mips - glibc, gcc5, linux headers 4.6
> 
> x86_64 - musl, gcc4.9, linux headers 4.7
> 
> I just kicked off builds again to repeat both failures.  Hopefully I
> can catch it soon!

These two build failures occured on Andre's machine when it started
acting silly (the machine, not Andre! ;-) ).

The failures did not occur on other machines, and Andre's ainstance has
been restarted and does not seem be be acting weird any;ore.

So I'd say we should not investigate those two.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
