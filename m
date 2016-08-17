From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 16 Aug 2016 21:27:07 -0500
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <D7AD0BF6-2CCF-405D-A7AD-3879A9EA2451@embedded.rocks>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <D7AD0BF6-2CCF-405D-A7AD-3879A9EA2451@embedded.rocks>
Message-ID: <CAFt09wOGVX9rhSgw_5MAvcEj07Vja5F79BkGbBf+UhfZC3GcpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg ,

On Fri, Aug 12, 2016 at 4:31 AM, J?rg Krause
<joerg.krause@embedded.rocks> wrote:
>
>
> Am 10. August 2016 16:14:55 MESZ, schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>>Hello all,
>>
>>Please find below the usual analysis of build failures. Hiroshi,
>>Waldemar, Gustavo, Fabrice, Yann, Dagg, J?rg, Vivien, Vicente, Samuel,
>>Peter, Joris, Alistair, please have a look below, there's some fun
>>stuff for you! :-) Thanks for your help.
>>
>>Thomas
>>
>>On Wed, 10 Aug 2016 08:30:29 +0200 (CEST), Thomas Petazzoni wrote:
>>
>>>       x86_64 |                 libtirpc-1.0.1 | NOK |
>>http://autobuild.buildroot.net/results/715c3ff13844a030767a49731069183aa02cc5f2/
>>
>>config.status: error: cannot find input file: `rpcgen/Makefile.in'
>>
>>J?rg, you've done quite some work on libtirpc, could you have a look at
>>this issue?
>
> I am on vacation until the end of next week. Sorry, someone else maybe?

Took a look at this and it doesn't seem to be consistently repeatable
( I have yet to see it fail).  I went back and it looks like this
occasionally has popped up starting on 8/6 and 8/9 on the following
architectures.

mips - glibc, gcc5, linux headers 4.6

x86_64 - musl, gcc4.9, linux headers 4.7

I just kicked off builds again to repeat both failures.  Hopefully I
can catch it soon!

Thanks
Matt
