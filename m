From: William Wagner <will_wagner@carallon.com>
Date: Tue, 20 Apr 2010 12:22:04 +0100
Subject: [Buildroot] makedev questions
In-Reply-To: <8739yqbccd.fsf@macbook.be.48ers.dk>
References: <4BCD83D4.6000306@carallon.com>
	<8739yqbccd.fsf@macbook.be.48ers.dk>
Message-ID: <4BCD8E5C.2020908@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/2010 12:19, Peter Korsgaard wrote:
>>>>>> "William" == William Wagner<will_wagner@carallon.com>  writes:
>>>>>>              
>   William>  Hello,
>   William>  Just trying to get everything working again following recent changes
>   William>  in git. After the makedev change I have a couple of questions.
>
>   William>  Should the default value for BR2_PACKAGE_MAKEDEVS not be y?
>   William>  Without it you get a rootfs without any device nodes. Or am I
>   William>  missing something?
>
> No, BR2_PACKAGE_MAKEDEVS is for compiling makedevs to run on the target
> (unlikely to be interesting).
>
> Don't you have build/host-makedevs built? It seems to work here.
>
>    
Yes I do, just wasn't sure where I should be looking. Thanks

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
