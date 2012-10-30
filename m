From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 30 Oct 2012 10:07:59 +0000
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <87fw4xhubv.fsf@macbook.be.48ers.dk>
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk>
 <87boghzdjc.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
 <CAG2jQ8jMZ=PQEd=YJipP1cH=6-CyHD01YWsMYxZs67Rb5Wd2PQ@mail.gmail.com>
 <87ipapxbp2.fsf@macbook.be.48ers.dk>
 <87ehkytcjx.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i=z_RAvEdYt_Tx4Ma5DK7e6b9djTQsu81MVULqOte1mg@mail.gmail.com>
 <871ugyt92h.fsf@macbook.be.48ers.dk>
 <87fw4xhubv.fsf@macbook.be.48ers.dk>
Message-ID: <CAG2jQ8jSGeO7WowC_j2ij_QeAJackxXSiqnK4Ya4X7Eb2cKNhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2012 at 8:55 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Peter" == Peter Korsgaard <jacmet@sunsite.dk> writes:
>
> Hi,
>
>  Markos> I haven't managed to find a solution yet and I think all the
>  Markos> LFS problems are buildroot specific.  I don't have a native LFS
>  Markos> toolchain so I can try an out-of-buildroot build.  You can
>  Markos> either revert the commit or disable the LFS support in the
>  Markos> package for now.
>
>  Peter> ok, thanks.
>
>  Peter> I'll try to take another look, and revert if I don't see an easy
>  Peter> solution.
>
> I luckily found a solution (23f6455bff), which I've applied.
>
> --
> Bye, Peter Korsgaard

Hi Peter,

Hmm I thought that -D_FILE_OFFSET_BITS=64 was required when building
with LFS. I guess I was wrong.
Thanks for fixing it.

-- 
Regards,
Markos
