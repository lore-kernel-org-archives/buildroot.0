From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 23 Dec 2012 22:30:28 +0100
Subject: [Buildroot] [PATCH] toolchain-external: re-introduce Sourcery
 CodeBench ARM 2010.09
In-Reply-To: <8738ywtzej.fsf@dell.be.48ers.dk>
References: <1356270120-20416-1-git-send-email-plagnioj@jcrosoft.com>
 <8738ywtzej.fsf@dell.be.48ers.dk>
Message-ID: <20121223213027.GC11142@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19:08 Sun 23 Dec     , Peter Korsgaard wrote:
> >>>>> "J" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
>  J> on the lastest release the toolchain can not produce a working rootfs for
>  J> at91rm9200
> 
>  J> Tested on at91rm9200ek
> 
>  J> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>  J> ---
>  J> Hi,
> 
>  J> 	I try the internal toolchains of buildroot we have the same issue
> 
> Interesting. How did you configure it? I've used BR on the mini2440
> (s3c2440), which is also arm920t recently without problems.
I do nohing special just use busybox

and I try generic_arm and arm920t

both can not boot

I get the init that try to kill itself

I check the binary it's a EABIv5 so this should work
but it does not

I tried the 3.7.1, 3.6.6 and mainline (dt) none work

the only toolchain I succed is this one

I did not try to found a valid BR toolchain just use the default one

which boot fine on my other at91 (arm926ejs) with both Sourcery & BR
toolchains.

Best Regards,
J.
