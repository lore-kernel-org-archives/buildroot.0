From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 30 Sep 2012 10:20:25 +0200
Subject: [Buildroot] [PATCH RESEND] external-toolchain: add Sourcery
	CodeBench ARM 2012.03
In-Reply-To: <20120930100738.21106455@skate>
References: <1347271377-7685-1-git-send-email-fabio.porcedda@gmail.com>
 <87a9w860tj.fsf@macbook.be.48ers.dk> <20120930100738.21106455@skate>
Message-ID: <CAHkwnC82mQdUk42eR35URS0_TV3b7gjvtd1NGF568ZNkZ6DGKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 30, 2012 at 10:07 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Peter,
>
> On Sat, 29 Sep 2012 22:17:28 +0200, Peter Korsgaard wrote:
>> >>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>>
>>  Fabio> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>
>> Committed, thanks.
>
> Isn't this toolchain causing a problem with RPC support, since it has
> glibc 2.15 ?

This toolchain has the RPC support, from the "getting-started.pdf":

A.1.1. Changes in Sourcery CodeBench Lite 2012.03-57

RPC library functions. GLIBC has been changed so that programs may
again be built to use its
RPC library functions. The ability to build programs using these
functions had previously been disabled.

Best regards
-- 
Fabio Porcedda
