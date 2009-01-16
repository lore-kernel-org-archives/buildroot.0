From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 16 Jan 2009 10:42:30 +0100
Subject: [Buildroot] libglibg2 fails
In-Reply-To: <87iqof7hzd.fsf@macbook.be.48ers.dk>
References: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
	<87iqof7hzd.fsf@macbook.be.48ers.dk>
Message-ID: <1232098950.7129.1.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-16 klockan 09:49 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> When building libglib2 for both AVR32 and ARM I get the following:
>  Ulf> ...
>  Ulf> gconvert.c:55:2: error: 
>  Ulf>    #error GNU libiconv not in use but included iconv.h is from libiconv
>  Ulf> make[5]: *** [gconvert.lo] Fel 1
>  Ulf> ...
>  Ulf> make[1]: Leaving directory `<buildroot>/build_avr32/libglib2-2.19.4'
>  Ulf> ...
> 
>  Ulf> Is there anyone capable of building libglib2?
> 
> I've built it several times around christmas for arm (v4l)
> 
> Haven't tried since, so it sounds like recent breakage.
> 

I think it is a dependency that is missing.
Would appreciate it, if anyone with a working libglib2 for arm,
could post the .config to the list


-- 
Ulf Samuelsson
Atmel Nordic AB
