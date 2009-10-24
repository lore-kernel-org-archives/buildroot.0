From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Sat, 24 Oct 2009 11:49:49 -0700
Subject: [Buildroot] Nano runtime error
In-Reply-To: <87tyxozlsa.fsf@macbook.be.48ers.dk>
References: <4AE1582B.9050106@ethertek.ca> <4AE303B6.4090605@ethertek.ca>
	<87tyxozlsa.fsf@macbook.be.48ers.dk>
Message-ID: <4AE34C4D.9000108@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and List,

Sorry for my impatience. I realize this is no commercial support system, 
I stand corrected.

Locals is not enabled in uclibc.

Best Regards,

Dan.

Peter Korsgaard wrote:
>>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:
>>>>>>             
>
>  Dan> Hello Peter,
>
> Hi,
>
> Please don't mail me directly - That's what we have the mailing list
> for.
>
>  Dan> I asked my question on the mailing list but did not receive a
>  Dan> reply.
>
> You are too impatient - This is no commercial support system, you only
> sent you mail yesterday.
>
>  Dan> Could you please send me the nano binary file compiled for
>  Dan> ATMEL ARM AT91SAMG20. I am having problems making mine work on my ARM
>  Dan> hardware.
>
> No I cannot. I don't have a rootfs with nano at hand, and even if I did,
> the result would presumably be the same.
>
>  Dan> I would like to know if there is a problem with my development
>  Dan> environment, or if it is a nano compiling issue. I keep getting
>  Dan> the error nano: can't resolve symbol '__ctype_b' when running nano
>  Dan> on our hardware.
>
> Have you tried debugging it? Do your C library have a __ctype_b symbol?
> >From a quick google search there seem(ed) to be some issues with
> __ctype_b and uclibc with locales enabled - Do you have locales enabled?
>
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.5.423 / Virus Database: 270.14.29/2455 - Release Date: 10/24/09 06:43:00
>
>   

-- 
Dan Pattison
Ethertek Circuits
